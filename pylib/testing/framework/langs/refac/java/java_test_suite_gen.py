from testing.framework.langs.refac.java.java_input_converter import JavaInputConverter
from testing.framework.langs.refac.java.java_output_converter import JavaOutputConverter
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.test_suite_gen import TestSuiteGenerator, TestSuiteConverters
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.utils import to_camel_case


class JavaTestSuiteGenerator(TestSuiteGenerator):
    def __init__(self):
        super().__init__({'input': JavaInputConverter(), 'output': JavaOutputConverter()})

    def _get_imports(self):
        return '''
            import java.io.File;
            import java.io.IOException;
            import java.util.stream.Collectors;
            import java.nio.file.Files;
            import java.nio.file.Path;
            import java.util.concurrent.*;
            import java.util.*;
            import java.util.stream.*;
            import java.lang.reflect.Method;
            import com.fasterxml.jackson.annotation.JsonAutoDetect;
            import com.fasterxml.jackson.annotation.PropertyAccessor;
            import com.fasterxml.jackson.databind.ObjectMapper;
            import com.fasterxml.jackson.databind.JsonNode;'''

    def _get_testing_src(self, ts: TestSuite, converters: TestSuiteConverters, solution_src: str):
        return render_template('''
            {{solution_src}}
            class Runner {
                \tprivate static final ObjectMapper mapper; 
                \tstatic {
                    \t\tmapper = new ObjectMapper();
                    \t\tmapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
                \t}
                {% for converter in converters %}
                    \tstatic {{converter.ret_type}} {{converter.fn_name}}(JsonNode {{converter.arg_name}}) {
                        \t\t{{converter.src}}
                    \t}
                {% endfor %}
                \tpublic static void main(String[] args) throws Exception {
                \t\tSolution solution = new Solution();
                \t\tMethod method = Stream.of(Solution.class.getDeclaredMethods())
                \t\t\t.filter(m -> !m.isSynthetic() && m.getName().equals("{{fn_name}}"))
                \t\t\t.findFirst()
                \t\t\t.orElseThrow(() -> new IllegalStateException("Cannot find method {{fn_name}}"));
                \t\tmethod.setAccessible(true);
                \t\tList<String> lines = Files.lines(Path.of("{{ts.test_cases_file}}")).collect(Collectors.toList());
                \t\tfor (String line : lines) {
                \t\t\tString[] cols = line.split(";");
                \t\t\tJsonNode[] rows = new JsonNode[cols.length];
                \t\t\tfor (int i = 0; i < cols.length; i++) {
                \t\t\t\trows[i] = mapper.readTree(cols[i]);
                \t\t\t}
                \t\t\tlong start = System.nanoTime();
                \t\t\t\t{{converters.input_result.ret_type}} result = solution.{{fn_name}}(
                {% for converter in converters.input_args %}
                    \t\t\t\t{{converter.fn_name}}(rows[{{loop.index0}}]){% if not loop.last %}, {% endif %}
                {% endfor %});
                \t\t\tlong end = System.nanoTime();
                \t\t\tlong duration = TimeUnit.MILLISECONDS.convert(end - start, TimeUnit.NANOSECONDS);
                \t\t\tMap<String, Object> map = new HashMap<>();
                \t\t\tmap.put("expected", {{converters.input_result.fn_name}}(rows[rows.length-1]));
                \t\t\tmap.put("result", {{converters.output_result.fn_name}}(result));
                \t\t\tmap.put("args", Arrays.asList(
                {% for converter in converters.input_args %}
                    \t\t\t\t{{converter.fn_name}}(rows[{{loop.index0}}]){% if not loop.last %}, {% endif %}
                {% endfor %}));
                \t\t\tmap.put("duration", duration);
                \t\t\tSystem.out.println(getJson(map));
                \t\t\tSystem.out.flush();
                \t\t}
            \t}
            \tstatic String getJson(Object obj) {
            \t\ttry {
            \t\t\treturn mapper.writeValueAsString(obj);
            \t\t} catch(Exception exc) {
            \t\t\tthrow new RuntimeException(exc);
            \t\t}
            \t}
        }''', ts=ts, fn_name=to_camel_case(ts.fn_name), solution_src=solution_src, converters=converters)
