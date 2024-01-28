import unittest

from anki.testing.framework.kotlin.kotlin_output_converter import KotlinOutputConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class KotlinOutputConverterTests(unittest.TestCase):
    def setUp(self) -> None:
        self.converter = KotlinOutputConverter()
        ConverterFn.reset_counter()

    def test_array_of_arrays_of_ints(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', 'return value', 'Int', 'Int'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<Int>()
            for (item in value) {
                result.add(converter1(item))
            }
            return result''', 'List<Int>', 'List<Int>'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<List<Int>>()
            for (item in value) {
                result.add(converter2(item))
            }
            return result''', 'List<List<Int>>', 'List<List<Int>>'), converters[2])

    def test_object_conversion(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('a', '''return value''', 'Int', 'Int'), converters[0])
        self.assertEqual(ConverterFn('b', 'return value', 'Int', 'Int'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Any>()
            result.add(converter1(value.a))
            result.add(converter2(value.b))
            return result''', 'Edge', 'List<Any>'), converters[2])

    def test_obj_nested_list(self):
        tree = SyntaxTree.of(['object(list(int)[a],int[b])<Edge>[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', 'return value', 'Int', 'Int'), converters[0])
        self.assertEqual(ConverterFn('a', '''val result = mutableListOf<Int>()
            for (item in value) {
                result.add(converter1(item))
            }
            return result''', 'List<Int>', 'List<Int>'), converters[1])
        self.assertEqual(ConverterFn('b', 'return value', 'Int', 'Int'), converters[2])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Any>()
            result.add(converter2(value.a))
            result.add(converter3(value.b))
            return result
        ''', 'Edge', 'List<Any>'), converters[3])

    def test_map(self):
        tree = SyntaxTree.of(['map(string, object(list(int)[a],int[b])<Edge>)[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(6, len(converters))
        self.assertEqual(ConverterFn('', 'return value', 'String', 'String'), converters[0])
        self.assertEqual(ConverterFn('', 'return value', 'Int', 'Int'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Int>()
            for (item in value) {
                result.add(converter2(item))
            }
            return result''', 'List<Int>', 'List<Int>'), converters[2])
        self.assertEqual(ConverterFn('b', 'return value', 'Int', 'Int'), converters[3])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<Any>()
            result.add(converter3(value.a))
            result.add(converter4(value.b))
            return result
        ''', 'Edge', 'List<Any>'), converters[4])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Any>()
            for (entry in value.entries) {
                result.add(converter1(entry.key))
                result.add(converter5(entry.value))
            }
            return result''', 'Map<String, Edge>', 'List<Any>'), converters[5])

    def test_linked_list(self):
        tree = SyntaxTree.of(['linked_list(int)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', 'return value', 'Int', 'Int'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val visited = mutableSetOf<ListNode<Int>>()
            val result = mutableListOf<Any>()
            while (value != null && !visited.contains(value)) {
                result.add(converter1(value.data))
                visited.add(value)
                value = value.next
            }
            return result
        ''', 'ListNode<Int>', 'List<Any>'), converters[1])

    def test_binary_tree(self):
        tree = SyntaxTree.of(['binary_tree(int)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', 'return value', 'Int', 'Int'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<Int?>()
            val queue: Queue<BinaryTreeNode<Int>> = LinkedList<>()
            val visited = mutableSetOf<BinaryTreeNode<Int>>()
            queue.add(value)
            while (!queue.isEmpty()) {
                val node = queue.poll()
                if (node != null) {
                    visited.add(node)
                    result.add(converter1(node.data))
                } else {
                    result.add(null)
                }
                if (node != null && !visited.contains(node.left)) {
                    queue.add(node.left)
                }
                if (node != null && !visited.contains(node.right)) {
                    queue.add(node.right)
                }
            }
            for (i in result.size - 1 downTo 0) {
                if (result[i] == null) {
                    result.removeAt(i)
                } else {
                    break
                }
            }
            return result''', 'BinaryTreeNode<Int>', 'List<Int>'), converters[1])

