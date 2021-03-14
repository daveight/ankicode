import unittest

from testing.framework.dto.test_suite import TestSuite
from testing.framework.langs.cpp.cpp_test_suite_gen import CppTestSuiteGenerator
from testing.framework.langs.cpp.cpp_converter_gen import reset_counter
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTestSuiteGeneratorTests(unittest.TestCase):

    def test_solution_generation(self):
        reset_counter()
        test_suite = TestSuite('solution')
        test_suite.test_case_count = 2
        test_suite.test_cases_file = 'tmp.txt'
        type_expression = ['list(object(int[a])<Edge>)', 'int[b]']

        solution_src = '''
struct Edge {
    int a;
};

int solution(vector<Edge> a) {
\treturn 0;
}'''

        tree = SyntaxTree.of(type_expression)
        generator = CppTestSuiteGenerator()
        result = generator.generate_testing_src(solution_src, test_suite, tree)

        self.assertEqual('''#include <vector>
#include <array>
#include "lib/jute.h"
#include "lib/parser.h"
#include "lib/converter.h"

#include <functional>
#include <stdexcept>//begin_user_src
struct Edge {
    int a;
};

int solution(vector<Edge> a) {
    return 0;
}

int convert1(jute::jValue val) { return val.as_int(); }

Edge convert2(jute::jValue val) {
    Edge obj;
    obj.a = convert1(val[0]);
    return obj;
}

vector<Edge> convert3(jute::jValue val) {
    vector<Edge> res;
    for (int i = 0; i < val.size(); i++) {
        Edge obj = convert2(val[i]);
        res.push_back(obj);
    }
    return res;
}

jute::jValue convert4(int val) {
    jute::jValue res;
    res.set_type(jute::JNUMBER);
    res.set_string(std::to_string(val));
    return res;
}

jute::jValue convert5(Edge val) {
    jute::jValue res;
    res.set_type(jute::JOBJECT);
    jute::jValue prop;

    prop = convert4(val.a);
    res.add_property("a", prop);
    
    return res;
}

jute::jValue convert6(vector<Edge> val) {
    jute::jValue res; 
    res.set_type(jute::JARRAY);
    for (int i = 0; i < val.size(); i++) {
        res.add_element(convert5(val[i]));
    }
    return res;
}

int convert7(jute::jValue val) { return val.as_int(); }

jute::jValue convert8(int val) {
    jute::jValue res;
    res.set_type(jute::JNUMBER);
    res.set_string(std::to_string(val));
    return res;
}

int main() {
    ifstream in("tmp.txt"); 
    int index = 1;
    jute::jValue total;
    total.set_type(jute::JNUMBER);
    total.set_string("2");
    Solution solution;
    for (auto& row: CSVRange(in)) {
        auto started = std::chrono::high_resolution_clock::now();
        int result = solution.solution(convert3(row[0]));
        auto done = std::chrono::high_resolution_clock::now();
        jute::jValue json_result = convert8(result);
        jute::jValue response;
        response.set_type(jute::JOBJECT);
        response.add_property("expected", row[1]);
        response.add_property("result", json_result);
        jute::jValue json_args;
        json_args.set_type(jute::JARRAY);
        for (int k = 0; k < 1; k++) {
            json_args.add_element(convert6(convert3(row[0])));
        }
        response.add_property("args", json_args);
        jute::jValue counter;
        counter.set_type(jute::JNUMBER);
        counter.set_string(std::to_string(index));
        response.add_property("index", counter);
        jute::jValue duration;
        duration.set_type(jute::JNUMBER);
        duration.set_string(std::to_string(std::chrono::duration_cast<std::chrono::milliseconds>(done-started).count()));
        response.add_property("duration", duration);
        index++;
        response.add_property("test_case_count", total);
        std::cout << response.to_string() << endl;
    }
    return 0;
}''', result)
