from testing.framework.dto.test_suite import TestSuite
from testing.framework.generators.test_suite_gen import TestSuiteGenerator
from testing.framework.langs.cpp.cpp_converter_gen import CppConverterGenerator, CppResultConverterGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree
from testing.framework.syntax.utils import trim_indent

CPP_USER_SRC_START_MARKER = '//begin_user_src\n'


class CppTestSuiteGenerator(TestSuiteGenerator):
    """
        Generates test suite's source code in C++
    """

    IMPORTS = '''
#include <vector>
#include <array>
#include "lib/jute.h"
#include "lib/parser.h"
#include "lib/converter.h"

#include <functional>
#include <stdexcept>
'''

    MAIN_FUNCTION_TEMPLATE = '''
%(solution_src)s
%(converter_fns)s

int main() {
\tifstream in("%(file_path)s"); 
\tint index = 1;
\tjute::jValue total;
\ttotal.set_type(jute::JNUMBER);
\ttotal.set_string("%(total)s");
\tSolution solution;
\tfor (auto& row: CSVRange(in)) {
\t\tauto started = std::chrono::high_resolution_clock::now();
\t\t%(type)s result = solution.%(solution_function)s(%(args)s);
\t\tauto done = std::chrono::high_resolution_clock::now();
\t\tjute::jValue json_result = %(converter)s(result);
\t\tjute::jValue response;
\t\tresponse.set_type(jute::JOBJECT);
\t\tresponse.add_property("expected", %(expected)s);
\t\tresponse.add_property("result", json_result);
\t\tjute::jValue json_args;
\t\tjson_args.set_type(jute::JARRAY);
%(convert_args)s
\t\tresponse.add_property("args", json_args);
\t\tjute::jValue counter;
\t\tcounter.set_type(jute::JNUMBER);
\t\tcounter.set_string(std::to_string(index));
\t\tresponse.add_property("index", counter);
\t\tjute::jValue duration;
\t\tduration.set_type(jute::JNUMBER);
\t\tduration.set_string(std::to_string(std::chrono::duration_cast<std::chrono::milliseconds>(done-started).count()));
\t\tresponse.add_property("duration", duration);
\t\tindex++;
\t\tresponse.add_property("test_case_count", total);
\t\tstd::cout << response.to_string() << endl;
\t}
\treturn 0;
}'''

    CONVERT_JSON_ARGS_TEMPLATE = '\t\tfor (int k = 0; k < %(len)d; k++) {\n%(convert)s\t\t}'

    CONVERT_SINGLE_JSON_ARG_TEMPLATE = '\t\t\tjson_args.add_element(%(convert_result_fn)s(%(convert_fn)s(row[%(' + \
                                       'index)d])));\n'

    def __init__(self):
        self.converter_gen = CppConverterGenerator()
        self.result_converter_gen = CppResultConverterGenerator()

    def generate_testing_src(self, solution_src: str, ts: TestSuite, tree: SyntaxTree) -> str:
        """
        Generate test suite's source code in C++

        :param solution_src: input user's solution source code
        :param ts: input test suite
        :param tree: input syntax tree
        :return: test suite source code in java
        """
        all_fns = []
        arg_fns = []
        arg_result_fns = []
        args = []
        result_fn = None
        fn = None

        for i, node in enumerate(tree.nodes):
            fn = self.converter_gen.render(node, all_fns)
            arg_fns.append(fn)
            result_fn = self.result_converter_gen.render(node, all_fns)
            arg_result_fns.append(result_fn)
            args.append(fn.name + '(row[' + str(i) + '])')

        src = trim_indent(self.IMPORTS)
        src += CPP_USER_SRC_START_MARKER

        src += trim_indent(self.MAIN_FUNCTION_TEMPLATE % {
            'args': ', '.join(args[:-1]),
            'type': fn.type,
            'converter': result_fn.name,
            'solution_function': ts.func_name,
            'file_path': ts.test_cases_file.replace('\\', '\\\\'),
            'expected': 'row[' + str(len(tree.nodes) - 1) + ']',
            'convert_args': self.CONVERT_JSON_ARGS_TEMPLATE % {
                'len': len(arg_fns) - 1,
                'convert': ''.join([self.CONVERT_SINGLE_JSON_ARG_TEMPLATE % {
                   'convert_result_fn': arg_result_fns[i].name,
                   'convert_fn': arg_fns[i].name,
                   'index': i
                } for i in range(len(arg_fns) - 1)])},
            'total': ts.test_case_count,
            'converter_fns': '\n'.join([fn.getSrc() for fn in all_fns]),
            'solution_src': solution_src})

        return src
