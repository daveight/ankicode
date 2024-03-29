import unittest

from anki.testing.framework.java.java_output_converter import JavaOutputConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class JavaOutputConverterTests(unittest.TestCase):
    def setUp(self) -> None:
        self.converter = JavaOutputConverter()
        ConverterFn.reset_counter()

    def test_array_of_arrays_of_ints(self):
        tree = SyntaxTree.of(['array(array(int))[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('', 'return value;', 'int', 'int'), converters[0])
        self.assertEqual(ConverterFn('', '''
            int result[] = new int[value.length];
            int i = 0;
            for (int item : value) {
                result[i++] = converter1(item);
            }
            return result;''', 'int[]', 'int[]'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            int[] result[] = new int[value.length][];
            int i = 0;
            for (int[] item : value) {
                result[i++] = converter2(item);
            }
            return result;''', 'int[][]', 'int[][]'), converters[2])

    def test_object_conversion(self):
        tree = SyntaxTree.of(['object(int[a],int[b])<Edge>[a]'])
        _, converters = self.converter.get_converters(tree)
        self.assertEqual(3, len(converters))
        self.assertEqual(ConverterFn('a', '''return value;''', 'int', 'int'), converters[0])
        self.assertEqual(ConverterFn('b', 'return value;', 'int', 'int'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            List<Object> result = new ArrayList<>();
            result.add(converter1(value.a));
            result.add(converter2(value.b));
            return result;''', 'Edge', 'List'), converters[2])

    def test_obj_nested_list(self):
        tree = SyntaxTree.of(['object(list(int)[a],int[b])<Edge>[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(4, len(converters))
        self.assertEqual(ConverterFn('', 'return value;', 'Integer', 'Integer'), converters[0])
        self.assertEqual(ConverterFn('a', '''List<Integer> result = new ArrayList<>();
            for (Integer item : value) {
                result.add(converter1(item));
            }
            return result;''', 'List<Integer>', 'List<Integer>'), converters[1])
        self.assertEqual(ConverterFn('b', 'return value;', 'int', 'int'), converters[2])
        self.assertEqual(ConverterFn('a', '''
            List<Object> result = new ArrayList<>();
            result.add(converter2(value.a));
            result.add(converter3(value.b));
            return result;
        ''', 'Edge', 'List'), converters[3])

    def test_map(self):
        tree = SyntaxTree.of(['map(string, object(list(int)[a],int[b])<Edge>)[a]'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(6, len(converters))
        self.assertEqual(ConverterFn('', 'return value;', 'String', 'String'), converters[0])
        self.assertEqual(ConverterFn('', 'return value;', 'Integer', 'Integer'), converters[1])
        self.assertEqual(ConverterFn('a', '''
            List<Integer> result = new ArrayList<>();
            for (Integer item : value) {
                result.add(converter2(item));
            }
            return result;''', 'List<Integer>', 'List<Integer>'), converters[2])
        self.assertEqual(ConverterFn('b', 'return value;', 'int', 'int'), converters[3])
        self.assertEqual(ConverterFn('', '''
            List<Object> result = new ArrayList<>();
            result.add(converter3(value.a));
            result.add(converter4(value.b));
            return result;
        ''', 'Edge', 'List'), converters[4])
        self.assertEqual(ConverterFn('a', '''
            List<Object> result = new ArrayList<>();
            for (Map.Entry<String, Edge> entry : value.entrySet()) {
                result.add(converter1(entry.getKey()));
                result.add(converter5(entry.getValue()));
            }
            return result;''', 'Map<String, Edge>', 'List'), converters[5])

    def test_linked_list(self):
        tree = SyntaxTree.of(['linked_list(int)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', 'return value;', 'Integer', 'Integer'), converters[0])
        self.assertEqual(ConverterFn('', '''
            Set<ListNode<Integer>> visited = new HashSet<>();
            List result = new ArrayList();
            while (value != null && !visited.contains(value)) {
                result.add(converter1(value.data));
                visited.add(value);
                value = value.next;
            }
            return result;
        ''', 'ListNode<Integer>', 'List'), converters[1])

    def test_binary_tree(self):
        tree = SyntaxTree.of(['binary_tree(int)'])
        arg_converters, converters = self.converter.get_converters(tree)
        self.assertEqual(1, len(arg_converters))
        self.assertEqual(2, len(converters))
        self.assertEqual(ConverterFn('', 'return value;', 'Integer', 'Integer'), converters[0])
        self.assertEqual(ConverterFn('', '''
            List<Integer> result = new ArrayList<>();
            Queue<BinaryTreeNode<Integer>> queue = new LinkedList<>();
            Set<BinaryTreeNode<Integer>> visited = new HashSet<>();
            queue.add(value);
            while (!queue.isEmpty()) {
                BinaryTreeNode<Integer> node = queue.poll();
                if (node != null) {
                    visited.add(node);
                    result.add(converter1(node.data));
                } else {
                    result.add(null);
                }
                if (node != null && !visited.contains(node.left)) {
                    queue.add(node.left);
                }
                if (node != null && !visited.contains(node.right)) {
                    queue.add(node.right);
                }
            }
            for (int i = result.size() - 1; i > 0; i--) {
                if (result.get(i) == null) {
                    result.remove(i);
                } else {
                    break;
                }
            }
            return result;''', 'BinaryTreeNode<Integer>', 'List<Integer>'), converters[1])

