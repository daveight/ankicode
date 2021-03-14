from testing.framework.dto.test_suite import TestSuite
from testing.framework.generators.test_suite_gen import TestSuiteGenerator
from testing.framework.langs.js.js_converter_gen import JsConverterGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree
from testing.framework.syntax.utils import trim_indent, to_snake_case

JS_USER_SRC_START_MARKER = '//begin_user_src\n'


class JsTestSuiteGenerator(TestSuiteGenerator):
    """
    Generate test suite's source code in JavaScript
    """

    IMPORTS = '''
const imports = require('./converters')
const parseTestCase = require('./testcase').parseTestCase
'''

    MAIN_FUNCTION_TEMPLATE = '''
const fs = require('fs');
const readline = require('readline');
const fileStream = fs.createReadStream('%(file_path)s');
const rl = readline.createInterface({input: fileStream, crlfDelay: Infinity});
const converters = [%(converters_src)s];
let i = 0;
rl.on('line', function(line) {
\tconst start = new Date().getTime();
\tconst tc = parseTestCase(converters, line);
\tconst result = %(function_name)s(...tc.args);
\tconst end = new Date().getTime();
\tconsole.log(JSON.stringify({
\t\t'expected': tc.expected,
\t\t'args': tc.args,
\t\t'duration': (start-end),
\t\t'index': i,
\t\t'test_case_count': 0
\t}));
\ti += 1
});
'''

    def __init__(self):
        self.converter_generator = JsConverterGenerator()

    def generate_testing_src(self, solution_src: str, ts: TestSuite, tree: SyntaxTree) -> str:
        """
        Generate test suite's source code in python
        :param solution_src: input user's solution source code
        :param ts: input test suite
        :param tree: input syntax tree
        :return: test suite source code in python
        """
        src = trim_indent(self.IMPORTS) + '\n'
        src += JS_USER_SRC_START_MARKER
        src += trim_indent(solution_src) + '\n'
        converters_src = ', '.join(['imports.' + self.converter_generator.render(node) for node in tree.nodes])
        src += trim_indent(self.MAIN_FUNCTION_TEMPLATE % dict(
            function_name=to_snake_case(ts.func_name),
            converters_src=converters_src,
            file_path=ts.test_cases_file.replace('\\', '\\\\')))
        return src
