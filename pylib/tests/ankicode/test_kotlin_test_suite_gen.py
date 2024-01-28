from anki.testing.framework.kotlin.kotlin_test_suite_gen import KotlinTestSuiteGenerator
from tests.ankicode.test_utils import GeneratorTestCase
from anki.testing.framework.types import TestSuite, ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class KotlinTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self) -> None:
        self.generator = KotlinTestSuiteGenerator()
        ConverterFn.reset_counter()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'sum'
        tc.test_cases_file = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])

        solution_src = '''
            class Solution {
                fun sum(a: Int, b: Int): Int {
                    return a + b
                }
            }'''
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqualsIgnoreWhiteSpaces('''
            import com.fasterxml.jackson.databind.ObjectMapper;
            import com.fasterxml.jackson.databind.JsonNode;
            import com.fasterxml.jackson.annotation.JsonAutoDetect
            import com.fasterxml.jackson.annotation.PropertyAccessor
            import java.lang.reflect.Method
            import java.util.concurrent.TimeUnit
            import java.util.Scanner

            //begin_user_src
            class Solution {
                fun sum(a: Int, b: Int): Int {
                    return a + b
                }
            }

            object Runner {
                private val mapper = ObjectMapper()

                init {
                    mapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY)
                }

                fun converter1(value: JsonNode): Int {
                    return value.asInt()
                }

                fun converter2(value: JsonNode): Int {
                    return value.asInt()
                }

                fun converter3(value: JsonNode): Int {
                    return value.asInt()
                }

                fun converter4(value: Int): Int {
                    return value
                }

                fun converter5(value: Int): Int {
                    return value
                }

                fun converter6(value: Int): Int {
                    return value
                }

                @JvmStatic
                fun main(args: Array<String>) {
                    val solution = Solution()
                    val method: Method = Solution::class.java.declaredMethods
                        .firstOrNull { !it.isSynthetic && it.name == "sum" }
                        ?: throw IllegalStateException("Cannot find method sum")

                    method.isAccessible = true

                    val scanner = Scanner(System.`in`)
                    while (true) {
                        val line = scanner.nextLine()
                        val rows = mapper.readTree(line)
                        val start = System.nanoTime()
                        val result = solution.sum(converter1(rows[0]), converter2(rows[1]))
                        val end = System.nanoTime()
                        val duration = TimeUnit.MILLISECONDS.convert(end - start, TimeUnit.NANOSECONDS)
                        val map = hashMapOf<String, Any>(
                            "result" to converter6(result),
                            "duration" to duration
                        )
                        println(getJson(map))
                        System.out.flush()
                    }
                }

                private fun getJson(obj: Any): String {
                    return mapper.writeValueAsString(obj)
                }
            }
            ''', testing_src)
