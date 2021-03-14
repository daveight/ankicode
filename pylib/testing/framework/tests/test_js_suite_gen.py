import unittest

from testing.framework.dto.test_suite import TestSuite
from testing.framework.langs.js.js_test_suite_gen import JsTestSuiteGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree


class JsTestSuiteGeneratorTests(unittest.TestCase):

    def test_solution_generation(self):
        test_suite = TestSuite('solution')
        test_suite.test_case_count = 2
        test_suite.test_cases_file = 'tmp.txt'
        type_expression = ['int[a]', 'int[b]']
        solution_src = '''function solution(a, b) {
\treturn a + b
}'''
        tree = SyntaxTree.of(type_expression)
        generator = JsTestSuiteGenerator()
        result = generator.generate_testing_src(solution_src, test_suite, tree)
        self.assertEqual('''const imports = require('./converters')
const parseTestCase = require('./testcase').parseTestCase
//begin_user_src
function solution(a, b) {
    return a + b
}
const fs = require('fs');
const readline = require('readline');
const fileStream = fs.createReadStream('tmp.txt');
const rl = readline.createInterface({input: fileStream, crlfDelay: Infinity});
const converters = [imports.IntegerConverter(), imports.IntegerConverter()];
let i = 0;
rl.on('line', function(line) {
    const start = new Date().getTime();
    const tc = parseTestCase(converters, line);
    const result = solution(...tc.args);
    const end = new Date().getTime();
    console.log(JSON.stringify({
        'expected': tc.expected,
        'args': tc.args,
        'duration': (start-end),
        'index': i,
        'test_case_count': 0
    }));
    i += 1
});''', result)
