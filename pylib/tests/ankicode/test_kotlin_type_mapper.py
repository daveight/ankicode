from anki.testing.framework.kotlin.kotlin_type_mapper import KotlinTypeMapper
from anki.testing.framework.syntax.syntax_tree import SyntaxTree
from tests.ankicode.test_utils import GeneratorTestCase


class KotlinTypeMapperTests(GeneratorTestCase):
    def setUp(self) -> None:
        self.type_mapper = KotlinTypeMapper()

    def test_array_of_integers(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        args, _ = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('List<List<Int>>', args[0].type)
        self.assertEqual('a', args[0].name)

    def test_list_of_integer(self):
        tree = SyntaxTree.of(['list(int)[a]'])
        args, _ = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('List<Int>', args[0].type)
        self.assertEqual('a', args[0].name)

    def test_simple_int(self):
        tree = SyntaxTree.of(['int'])
        args, _ = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('Int', args[0].type)

    def test_class(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        args, type_defs = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('Edge', args[0].type)
        self.assertEqual('a', args[0].name)
        self.assertEqual(1, len(type_defs.keys()))
        self.assertEqual('data class Edge(var a: Int, var b: Int)', type_defs['Edge'])

    def test_object_list(self):
        tree = SyntaxTree.of(['list(object(int[a],int[b])<Edge>)[a]'])
        args, type_defs = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('List<Edge>', args[0].type)
        self.assertEqual('a', args[0].name)
        self.assertEqual(1, len(type_defs.keys()))
        self.assertEqual('data class Edge(var a: Int, var b: Int)', type_defs['Edge'])

    def test_map(self):
        tree = SyntaxTree.of(['map(string, list(object(int[a],int[b])<Edge>))[a]'])
        args, type_defs = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('Map<String, List<Edge>>', args[0].type)
        self.assertEqual('a', args[0].name)
        self.assertEqual(1, len(type_defs.keys()))
        self.assertEqual('data class Edge(var a: Int, var b: Int)', type_defs['Edge'])

    def test_linked_list(self):
        tree = SyntaxTree.of(['linked_list(int)'])
        args, type_defs = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('ListNode<Int>', args[0].type)
        self.assertEqual(1, len(type_defs.keys()))
        self.assertEqualsIgnoreWhiteSpaces('''
            data class ListNode<T>(var data: T, var next: ListNode<T>? = null)''', type_defs['linked_list'])

    def test_binary_tree(self):
        tree = SyntaxTree.of(['binary_tree(int)'])
        args, type_defs = self.type_mapper.get_args(tree)
        self.assertEqual(1, len(args))
        self.assertEqual('BinaryTreeNode<Int>?', args[0].type)
        self.assertEqual(1, len(type_defs.keys()))
        self.assertEqualsIgnoreWhiteSpaces('''
            data class BinaryTreeNode<T>(var data: T, var left: BinaryTreeNode<T>? = null, var right: BinaryTreeNode<T>? = null)''', type_defs['binary_tree'])

