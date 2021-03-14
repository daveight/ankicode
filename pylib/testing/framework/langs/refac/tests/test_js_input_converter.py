import unittest

from testing.framework.langs.refac.js.js_input_converter import JsInputConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class JsInputConverterTests(unittest.TestCase):

    def setUp(self) -> None:
        self.converter = JsInputConverter()
        ConverterFn.reset_counter()

    def test_array_of_arrays_of_ints(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', '''return val''', ''), converters[0])
        self.assertEqual(ConverterFn('', '''
            var res = []
            for (var i = 0; i < val.length; i++) { res.push(converter1(val[i])) }
            return res'''.lstrip(), ''), converters[1])
        self.assertEqual(ConverterFn('a', '''
            var res = []
            for (var i = 0; i < val.length; i++) { res.push(converter2(val[i])) }
            return res'''.lstrip(), ''), converters[2])

    def test_object_conversion(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('a', '''return val''', ''), converters[0])
        self.assertEqual(ConverterFn('b', '''return val''', ''), converters[1])
        self.assertEqual(ConverterFn('a', '''
            var res = {}
            res['a'] = converter1(val[1])
            res['b'] = converter2(val[2])
            return res
        ''', ''), converters[2])

    def test_obj_nested_list(self):
        tree = SyntaxTree.of(['object(list(int)[a],int[b])<Edge>[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', '''return val''', ''), converters[0])
        self.assertEqual(ConverterFn('a', '''
            var res = []
            for (var i = 0; i < val.length; i++) { res.push(converter1(val[i])) }
            return res'''.lstrip(), ''), converters[1])
        self.assertEqual(ConverterFn('b', '''return val''', ''), converters[2])
        self.assertEqual(ConverterFn('a', '''
            var res = {}
            res['a'] = converter2(val[1])
            res['b'] = converter3(val[2])
            return res
        ''', ''), converters[3])
