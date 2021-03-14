import unittest

from testing.framework.langs.refac.java.java_test_suite_gen import JavaTestSuiteGenerator
from testing.framework.langs.refac.java.java_type_mapper import JavaTypeMapper
from testing.framework.langs.refac.tests.test_utils import GeneratorTestCase
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree


class JavaTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self) -> None:
        self.generator = JavaTestSuiteGenerator()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'sum'
        tc.test_file_path = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])

        solution_src = '''
            public class Solution {
                int solution(int a, int b) {
                    return a + b;
                }
            }'''
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqualsIgnoreWhiteSpaces('''
            import java.io.File;
            import java.io.IOException;
            import java.util.stream.Collectors;
            import java.nio.file.Files;
            import java.nio.file.Path;
            import java.util.concurrent.*;
            import java.util.*;
            import java.util.stream.*;
            import java.lang.reflect.Method;
            import ankitest.TestCase;
            import com.fasterxml.jackson.annotation.JsonAutoDetect;
            import com.fasterxml.jackson.annotation.PropertyAccessor;
            import com.fasterxml.jackson.databind.ObjectMapper;
            import java.util.concurrent.atomic.AtomicInteger;
 
            //begin_user_src
            public class Solution {
                int solution(int a, int b) {
                    return a + b;
                }
            }
 
            public class Runner {
                private static final ObjectMapper mapper; 
                static {
                    mapper = new ObjectMapper();
                    mapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
                }

                public static void main(String[] args) throws Exception {
                    AtomicInteger index = new AtomicInteger(0);
                    Solution solution = new Solution();
                    Method method = Stream.of(Solution.class.getDeclaredMethods())
                        .filter(m -> !m.isSynthetic() && m.getName().equals("%(function_name)s"))
                        .findFirst()
                        .orElseThrow(() -> new IllegalStateException("Cannot find method %(function_name)s"));
                    method.setAccessible(true);
 
                    List<String> lines = Files.lines(Path.of("%(file_path)s")).collect(Collectors.toList());
                    for (String line : lines) {
                        String[] cols = line.split(";");
                        Object[] args = new Object[cols.length];
                        for (String col : cols) {
                            int i = 0;
                            JsonNode node = mapper.readTree(col);

                        }
                        long start = System.nanoTime();
                        Object result = null;
                        try {
                            result = method.invoke(solution, args);
                        } catch(Exception exc) {
                            throw new RuntimeException(exc);
                        }
                        long end = System.nanoTime();
                        long duration = TimeUnit.MILLISECONDS.convert(end - start, TimeUnit.NANOSECONDS);
                        Map<String, Object> map = new HashMap<>();
                        map.put("expected", tc.getExpected());
                        map.put("result", result);
                        map.put("args", tc.getArgs());
                        map.put("duration", duration);
                        map.put("index", index.incrementAndGet());
                        System.out.println(getJson(map));
                    }
                }
            }
            ''', testing_src)
