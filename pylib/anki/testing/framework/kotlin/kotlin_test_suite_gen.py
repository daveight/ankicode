# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Java implementation of the Test Suite Generator API
"""

from anki.testing.framework.kotlin.kotlin_input_converter import KotlinInputConverter
from anki.testing.framework.kotlin.kotlin_output_converter import KotlinOutputConverter
from anki.testing.framework.string_utils import render_template
from anki.testing.framework.test_suite_gen import TestSuiteGenerator, TestSuiteConverters
from anki.testing.framework.types import TestSuite
from anki.testing.framework.string_utils import to_camel_case


class KotlinTestSuiteGenerator(TestSuiteGenerator):
    """
    Generates a test suite source code in Kotlin.
    """

    def __init__(self):
        super().__init__(input_converter=KotlinInputConverter(), output_converter=KotlinOutputConverter())

    def get_imports(self):
        """
        :return: string containing Java imports
        """
        return '''
            import com.fasterxml.jackson.databind.ObjectMapper;
            import com.fasterxml.jackson.databind.JsonNode;
            import com.fasterxml.jackson.annotation.JsonAutoDetect
            import com.fasterxml.jackson.annotation.PropertyAccessor
            import java.util.LinkedList
            import java.lang.reflect.Method
            import java.util.concurrent.TimeUnit
            import java.util.Scanner'''

    def get_testing_src(self, ts: TestSuite, converters: TestSuiteConverters, solution_src: str):
        """
        Generates a source code for an input test suite and a solution function
        :param ts: target test suite
        :param converters: list of type converters
        :param solution_src: source code containing solution
        :return: source code for a test suite
        """
        return render_template('''
            {{solution_src}}
            object Runner {
                \tprivate val mapper = ObjectMapper()
                \tinit {
                    \t\tmapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY)
                \t}
                {% for c in converters.all %}
                    \tfun {{c.fn_name}}({{c.arg_name}}: {{c.arg_type}}): {{c.ret_type}} {
                        \t\t{{c.src}}
                    \t}
                {% endfor %}
                \t@JvmStatic
                \tfun main(args: Array<String>) {
                \t\tval solution = Solution()
                \t\tval method: Method = Solution::class.java.declaredMethods
                    .firstOrNull { !it.isSynthetic && it.name == "{{fn_name}}" }
                    ?: throw IllegalStateException("Cannot find method {{fn_name}}")
                \t\tmethod.isAccessible = true
                \t\tval scanner = Scanner(System.`in`)
                \t\twhile (true) {
                \t\t\tval line = scanner.nextLine()
                \t\t\tval rows = mapper.readTree(line)
                \t\t\tval start = System.nanoTime()
                \t\t\t\tval result = solution.{{fn_name}}(
                {% for converter in converters.args %}
                    \t\t\t\t{{converter.fn_name}}(rows[{{loop.index0}}]){% if not loop.last %}, {% endif %}
                {% endfor %})
                \t\t\tval end = System.nanoTime()
                \t\t\tval duration = TimeUnit.MILLISECONDS.convert(end - start, TimeUnit.NANOSECONDS)
                \t\t\tval map = hashMapOf<String, Any>(
                \t\t\t\t"result" to {{converters.output.fn_name}}(result),
                \t\t\t\t"duration" to duration
                \t\t\t)
                \t\t\tprintln(getJson(map))
                \t\t\tSystem.out.flush()
                \t\t}
                \t}
                \tprivate fun getJson(obj: Any): String {
                \t\treturn mapper.writeValueAsString(obj)
                \t}
        }''', ts=ts, fn_name=to_camel_case(ts.fn_name), solution_src=solution_src, converters=converters)
