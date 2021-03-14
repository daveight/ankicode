from testing.framework.langs.refac.cpp.cpp_test_suite_gen import CppTestSuiteGenerator
from testing.framework.langs.refac.tests.test_utils import GeneratorTestCase
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self) -> None:
        self.generator = CppTestSuiteGenerator()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'sum'
        tc.test_file_path = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])

        solution_src = '''
            int solution(int a, int b) {
                return a + b;
            }'''
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqualsIgnoreWhiteSpaces('''
            #include <vector>
            #include <array>
            #include "lib/jute.h"
            #include "lib/parser.h"
            #include "lib/converter.h"
            #include <functional>
            #include <stdexcept>

            //begin_user_src
            int solution(int a, int b) {
                return a + b;
            }
            int converter1(jute::jValue value) {
                return value.as_int();
            }
            int converter2(jute::jValue value) {
                return value.as_int();
            }

            int converter3(jute::jValue value) {
                return value.as_int();
            }

            jute::jValue converter4(int value) {
                jute::jValue result;
                result.set_type(jute::JNUMBER);
                result.set_string(std::to_string(value));
                return result;
            }

            int main() {
                ifstream in("test.txt"); 
                int index = 1;
                Solution solution;
                for (auto& row: CSVRange(in)) {
                    auto started = std::chrono::high_resolution_clock::now();
                    int result = solution.sum(converter1(row[0]), converter2(row[1]));
                    auto done = std::chrono::high_resolution_clock::now();
                    jute::jValue json_result = converter4(result);
                    jute::jValue response;
                    response.set_type(jute::JOBJECT);
                    response.add_property("expected", row[2]);
                    response.add_property("result", json_result);
                    jute::jValue json_args;
                    json_args.set_type(jute::JARRAY);
                    json_args.add_element(row[0]);
                    json_args.add_element(row[1]);
                    response.add_property("args", json_args);
                    jute::jValue counter;
                    counter.set_type(jute::JNUMBER);
                    counter.set_string(std::to_string(index));
                    response.add_property("index", counter);
                    jute::jValue duration;
                    duration.set_type(jute::JNUMBER);
                    duration.set_string(std::to_string(
                        std::chrono::duration_cast<std::chrono::milliseconds>(done-started).count()));
                    response.add_property("duration", duration);
                    index++;
                    std::cout << response.to_string() << endl;
                }
                return 0;
            }''', testing_src)
