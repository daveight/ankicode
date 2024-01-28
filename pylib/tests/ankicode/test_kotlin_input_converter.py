import textwrap
import unittest

from anki.testing.framework.kotlin.kotlin_input_converter import KotlinInputConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class KotlinInputConverterTests(unittest.TestCase):
    def setUp(self) -> None:
        self.converter = KotlinInputConverter()
        ConverterFn.reset_counter()

    def test_array_of_arrays_of_ints(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asInt()''', 'JsonNode', 'Int'), converters[0])
        self.assertEqual(ConverterFn('', textwrap.dedent('''
            val result = mutableListOf<Int>()
            for (node in value) {
                result.add(converter1(node))
            }
            return result'''), 'JsonNode', 'List<Int>'), converters[1])
        self.assertEqual(ConverterFn('a', textwrap.dedent('''
            val result = mutableListOf<List<Int>>()
            for (node in value) {
                result.add(converter2(node))
            }
            return result'''), 'JsonNode', 'List<List<Int>>'), converters[2])

    def test_object_conversion(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('a', '''return value.asInt()''', 'JsonNode', 'Int'), converters[0])
        self.assertEqual(ConverterFn('b', '''return value.asInt()''', 'JsonNode', 'Int'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            return Edge(a=converter1(value[0]), b=converter2(value[1]))
        ''', 'JsonNode', 'Edge'), converters[2])

    def test_obj_nested_list(self):
        tree = SyntaxTree.of(['object(list(int)[a],int[b])<Edge>[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asInt()''', 'JsonNode', 'Int'), converters[0])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Int>()
            for (node in value) {
                result.add(converter1(node))
            }
            return result''', 'JsonNode', 'List<Int>'), converters[1])
        self.assertEqual(ConverterFn('b', '''return value.asInt()''', 'JsonNode', 'Int'), converters[2])
        self.assertEqual(ConverterFn('a', '''
            return Edge(a=converter2(value[0]), b=converter3(value[1]))
        ''', 'JsonNode', 'Edge'), converters[3])

    def test_map(self):
        tree = SyntaxTree.of(['map(string, object(list(int)[a],int[b])<Edge>)[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(6, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''return value.asInt()''', 'JsonNode', 'Int'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableListOf<Int>()
            for (node in value) {
                result.add(converter2(node))
            }
            return result''', 'JsonNode', 'List<Int>'), converters[2])
        self.assertEqual(ConverterFn('b', '''return value.asInt()''', 'JsonNode', 'Int'), converters[3])
        self.assertEqual(ConverterFn('', '''
            return Edge(a=converter3(value[0]), b=converter4(value[1]))
        ''', 'JsonNode', 'Edge'), converters[4])
        self.assertEqual(ConverterFn('a', '''
            val result = mutableMapOf<String, Edge>()
            val iterator = value.iterator()
            while (iterator.hasNext()) {
                val key = converter1(iterator.next())
                val keyVal = converter5(iterator.next())
                result[key] = keyVal
            }
            return result''', 'JsonNode', 'Map<String, Edge>'), converters[5])

    def test_linked_list(self):
        tree = SyntaxTree.of(['linked_list(string)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val nodes = mutableListOf<ListNode<String>>()
            for (i in 0 until value.size step 2) {
                val n = value[i]
                val node = ListNode<String>(data=converter1(n))
                nodes.add(node)
            }
            for (i in 1 until value.size() step 2) {
                val n = value[i]
                val node = nodes[(i - 1) / 2]
                val nextIndex = n.asInt()
                if (nextIndex >= 0) {
                    val nextNode = nodes[nextIndex]
                    node.next = nextNode
                }
            }
            return if (nodes.isEmpty()) null else nodes[0]
        ''', 'JsonNode', 'ListNode<String>'), converters[1])

    def test_binary_tree(self):
        tree = SyntaxTree.of(['binary_tree(string)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val nodes = mutableListOf<BinaryTreeNode<String>?>()
            for (n in value) {
                var node = BinaryTreeNode<String>()
                if (n.isNull()) {
                    node = null
                } else {
                    node.data = converter1(n)
                }
                nodes.add(node)
            }
            if (nodes.isEmpty()) {
                return BinaryTreeNode<String>()
            }
            val children: Deque<BinaryTreeNode<String>> = LinkedList<BinaryTreeNode<String>>(nodes)
            val root = children.removeFirst()

            for (node in nodes) {
                if (node != null) {
                    if (children.isNotEmpty()) {
                        node.left = children.removeFirst()
                    }
                    if (children.isNotEmpty()) {
                        node.right = children.removeFirst()
                    }
                }
            }
            
            return root
        ''', 'JsonNode', 'BinaryTreeNode<String>'), converters[1])


    def test_array_nested_linked_list(self):
        tree = SyntaxTree.of(['array(linked_list(string))'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<ListNode<String>>()
            for (node in value) {
                result.add(converter2(node))
            }
            return result
        ''', 'JsonNode', 'List<ListNode<String>>'), converters[2])

    def test_array_double_nested_linked_list(self):
        tree = SyntaxTree.of(['array(linked_list(linked_list(string))'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<ListNode<ListNode<String>>>()
            for (node in value) {
                result.add(converter3(node))
            }
            return result
        ''', 'JsonNode', 'List<ListNode<ListNode<String>>>'), converters[3])

    def test_array_nested_array_nested_linked_list(self):
        tree = SyntaxTree.of(['array(array(linked_list(string))'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', '''return value.asText()''', 'JsonNode', 'String'), converters[0])
        self.assertEqual(ConverterFn('', '''
            val result = mutableListOf<List<ListNode<String>>>()
            for (node in value) {
                result.add(converter3(node))
            }
            return result
        ''', 'JsonNode', 'List<List<ListNode<String>>>'), converters[3])

