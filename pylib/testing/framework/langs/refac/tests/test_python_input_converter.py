import unittest

from testing.framework.langs.refac.python.python_input_converter import PythonInputConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonInputConverterTests(unittest.TestCase):

    def setUp(self) -> None:
        self.converter = PythonInputConverter()
        ConverterFn.reset_counter()

    def test_array_of_arrays_of_ints(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', '\treturn int(val)', '', 'int'), converters[0])
        self.assertEqual(ConverterFn('', '\treturn [converter1(item) for item in val]', '', 'List[int]'),
                         converters[1])
        self.assertEqual(ConverterFn('a', '\treturn [converter2(item) for item in val]', '', 'List[List[int]]'),
                         converters[2])

    def test_object_conversion(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('a', '\treturn int(val)', '', 'int'), converters[0])
        self.assertEqual(ConverterFn('b', '\treturn int(val)', '', 'int'), converters[1])
        self.assertEqual(ConverterFn('a', '\tEdge(converter1(val[0]),converter2(val[1]))', 'List', 'Edge'),
                         converters[2])

    def test_obj_nested_list(self):
        tree = SyntaxTree.of(['object(list(int)[a],int[b])<Edge>[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', '\treturn int(val)', '', 'int'), converters[0])
        self.assertEqual(ConverterFn('a', '\treturn [converter1(item) for item in val]', '', 'List[int]'),
                         converters[1])
        self.assertEqual(ConverterFn('b', '\treturn int(val)', '', 'int'), converters[2])
        self.assertEqual(ConverterFn('a', '\tEdge(converter2(val[0]),converter3(val[1]))', 'List', 'Edge'),
                         converters[3])

