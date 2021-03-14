from testing.framework.langs.refac.cpp.cpp_input_converter import CppInputConverter
from testing.framework.langs.refac.cpp.cpp_output_converter import CppOutputConverter
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.test_suite_gen import TestSuiteGenerator, TestSuiteConverters
from testing.framework.langs.refac.types import TestSuite


class CppTestSuiteGenerator(TestSuiteGenerator):

    def __init__(self):
        super().__init__({'input': CppInputConverter(), 'output': CppOutputConverter()})

    def _get_imports(self):
        return '''
            \t#include <vector>
            \t#include <array>
            \t#include "lib/jute.h"
            \t#include "lib/parser.h"
            \t#include <functional>
            \t#include <stdexcept>
            \tusing namespace std;'''

    def _get_testing_src(self, ts: TestSuite, converters: TestSuiteConverters, solution_src: str):
        return render_template('''
            {{src}}
            {% for c in converters %}
                {{c.ret_type}} {{c.fn_name}}({{c.arg_type}} {{c.arg_name}}) {
                    {{c.src}}
                }
            {% endfor %}
            int main() {
            \tifstream in("{{ts.test_cases_file}}"); 
            \tSolution solution;
            \tfor (auto& row: CSVRange(in)) {
            \t\tauto started = std::chrono::high_resolution_clock::now();
            \t\t{{converters.input_result.ret_type}} result = solution.{{ts.fn_name}}(
                {% for converter in converters.input_args %}
                    \t\t{{converter.fn_name}}(row[{{loop.index0}}]){% if not loop.last %}, {% endif %}
                {% endfor %});
            \t\tauto done = std::chrono::high_resolution_clock::now();
            \t\tjute::jValue json_result = {{converters.output_result.fn_name}}(result);
            \t\tjute::jValue response;
            \t\tresponse.set_type(jute::JOBJECT);
            \t\tresponse.add_property("expected", row[{{converters.output_args|length}}]);
            \t\tresponse.add_property("result", json_result);
            \t\tjute::jValue json_args;
            \t\tjson_args.set_type(jute::JARRAY);
            {% for i in range(converters.output_args|length) %}
                \t\tjson_args.add_element(row[{{i}}]);
            {% endfor %}
            \t\tresponse.add_property("args", json_args);
            \t\tjute::jValue duration;
            \t\tduration.set_type(jute::JNUMBER);
            \t\tduration.set_string(
                std::to_string(std::chrono::duration_cast<std::chrono::milliseconds>(done-started).count()));
            \t\tresponse.add_property("duration", duration);
            \t\tstd::cout << response.to_string() << endl;
            \t}
            \treturn 0;
            }''', ts=ts, src=solution_src, converters=converters)
