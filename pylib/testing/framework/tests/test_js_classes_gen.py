import unittest

from testing.framework.langs.js.js_class_gen import JsClassGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree


class JsClassesGeneratorTests(unittest.TestCase):

    def evaluate_generator(self, type_expression, expected_classes):
        tree = SyntaxTree.of([type_expression])
        generator = JsClassGenerator()
        classes = {}
        for node in tree.nodes:
            generator.render(node, classes)
        self.assertEqual(classes, expected_classes)

    def test_nested_objects(self):
        self.evaluate_generator(
            'object(object(list(int)[a])<TypeB>[obj_b], int[b])<TypeA>[obj_a]', {'TypeB': '''@typedef TypeB
@property {number[]} a''', 'TypeA': '''@typedef TypeA
@property {TypeB} obj_b
@property {number} b'''})

    def test_list_of_objects(self):
        self.evaluate_generator('list(object(int[start], int[finish])<Event>)', {'Event': '''@typedef Event
@property {number} start
@property {number} finish'''})
