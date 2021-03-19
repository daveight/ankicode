import unittest

from testing.framework.langs.refac.java.java_input_converter import JavaInputConverter
from testing.framework.langs.refac.test_suite_gen import TestSuiteConverters
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class TestSuiteConvertersTests(unittest.TestCase):

    def setUp(self) -> None:
        ConverterFn.reset_counter()

    def test_simple(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        converters = TestSuiteConverters({'input': JavaInputConverter(), 'output': JavaInputConverter()}, tree)
        self.assertEqual(6, len(converters))
        self.assertEqual('converter3', converters.input_result.fn_name)
