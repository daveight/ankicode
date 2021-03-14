import unittest

from testing.framework.langs.cpp.cpp_class_gen import CppClassGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppUserTypeGeneratorTests(unittest.TestCase):

    def evaluate_generator(self, type_expression, expected_type):
        tree = SyntaxTree.of([type_expression])
        generator = CppClassGenerator()
        classes = {}
        for node in tree.nodes:
            generator.render(node, classes)
        self.assertEqual(len(classes), 2)
        self.assertEqual(expected_type[0], classes['TypeB'])
        self.assertEqual(expected_type[1], classes['TypeA'])

    def test_nested_objects(self):
        self.evaluate_generator(
            'object(object(int[a])<TypeB>[obj_b], int[b])<TypeA>[obj_a]', ['''struct TypeB {
\tint a;
};''', '''struct TypeA {
\tTypeB obj_b;
\tint b;
};'''])
