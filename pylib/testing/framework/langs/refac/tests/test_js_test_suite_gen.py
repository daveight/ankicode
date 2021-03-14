import textwrap
import unittest

from testing.framework.langs.refac.js.js_test_suite_gen import JsTestSuiteGenerator
from testing.framework.langs.refac.js.js_type_mapper import JsTypeMapper
from testing.framework.langs.refac.tests.test_utils import GeneratorTestCase
from testing.framework.langs.refac.types import TestSuite, ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class JsTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self):
        self.generator = JsTestSuiteGenerator()
        ConverterFn.reset_counter()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'sum'
        tc.test_file_path = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])

        solution_src = '''
            function solution(a, b) {
                return a + b;
            }'''
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqualsIgnoreWhiteSpaces('''
            const fs = require('fs');
            const readline = require('readline');
            const fileStream = fs.createReadStream('test.txt');
            const rl = readline.createInterface({input: fileStream, crlfDelay: Infinity});

            function converter1(val) {
                return val
            }

            function converter2(val) {
                return val
            }

            function converter3(val) {
                return val
            }

            //begin_user_src
            function solution(a, b) {
                return a + b;
            }
            let i = 0;
            rl.on('line', function(line) {
                const start = new Date().getTime();
                const cols = row.split(';').map(it => JSON.parse(it))
                
                const args = []
                args.push(converter1(cols[1]);
                args.push(converter2(cols[2]);
                args.push(converter3(cols[3]);

                const result = sum(...args);
                const end = new Date().getTime();
                console.log(JSON.stringify({
                    'expected': tc.expected,
                    'args': tc.args,
                    'duration': (start-end),
                    'index': i
                }));
                i += 1
            });''', testing_src)
