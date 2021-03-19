import textwrap
import unittest

from testing.framework.langs.refac.python.python_test_suite_gen import PythonTestSuiteGenerator
from testing.framework.langs.refac.tests.test_utils import GeneratorTestCase
from testing.framework.langs.refac.types import TestSuite, Function, ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonTestSuiteGeneratorTests(GeneratorTestCase):

    def setUp(self) -> None:
        self.generator = PythonTestSuiteGenerator()
        ConverterFn.reset_counter()

    def test_solution_generation_simple_int(self):
        tc = TestSuite()
        tc.fn_name = 'solution'
        tc.test_cases_file = 'test.txt'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])
        solution_src = 'def solution(a: int, b: int) -> int:\n    return a + b'
        testing_src = self.generator.generate_test_suite_src(tc, tree, solution_src)
        self.assertEqualsIgnoreWhiteSpaces('''
            import datetime
            import json
            from typing import List
            #begin_user_src
            def solution(a: int, b: int) -> int:
                return a + b
            def converter1(value) -> int:
                return int(value)

            def converter2(value) -> int:
                return int(value)

            def converter3(value) -> int:
                return int(value)

            def converter4(value) -> int:
                return value

            def converter5(value) -> int:
                return value

            def converter6(value) -> int:
                return value
            
            file = open('test.txt')
            lines = file.readlines()
            for line in lines:
                values = []
                cols = line.split(';')
                for i, col in enumerate(cols):
                    values.append(json.loads(col))
                args = []
                args.append(converter1(values[0]))
                args.append(converter2(values[1]))
                start = datetime.datetime.now()
                result = solution(*args)
                end = datetime.datetime.now()
                time_diff = (end - start)
                duration = (time_diff.days * 86400000) + (time_diff.seconds * 1000) + (time_diff.microseconds / 1000)
                print(json.dumps({'expected': values[len(values) - 1],
                    'result': converter6(result),
                    'args': args,
                    'duration': duration }, default=lambda obj: obj.__dict__))
            ''', testing_src)

