import textwrap
import unittest

from testing.framework.langs.refac.python.python_test_suite_gen import PythonTestSuiteGenerator
from testing.framework.langs.refac.tests.test_utils import GeneratorTestCase
from testing.framework.langs.refac.types import TestSuite, Function
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self) -> None:
        self.generator = PythonTestSuiteGenerator()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'solution'
        tc.test_cases_file = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])
        solution_src = '''
            def solution(a: int, b: int) -> int:
                \treturn a + b'''
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqual(textwrap.dedent('''
            import datetime
            import json

            //begin_user_src
 
            def solution(a: int, b: int) -> int:
                return a + b
            i = 0
            file = open('test.txt')
            lines = file.readlines()
            for line in lines:
                i += 1
                values = []
                cols = line.split(';')
                for i, col in enumerate(cols):
                    values.append(json.loads(col))
                args = []

                start = datetime.datetime.now()
                result = solution(*args)
                end = datetime.datetime.now()
                time_diff = (end - start)
                duration = (time_diff.days * 86400000) + (time_diff.seconds * 1000) + (time_diff.microseconds / 1000)
                print(json.dumps({'expected': args[len(args) - 1],
                    'result': result,
                    'args': test_case.args,
                    'duration': duration,
                    'index': i}, default=lambda obj: obj.__dict__))
            ''').strip(), testing_src.strip())

