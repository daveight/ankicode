import textwrap
import unittest

from anki.testing.framework.kotlin.kotlin_template_gen import KotlinTemplateGenerator
from anki.testing.framework.types import TestSuite
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class KotlinTemplateGeneratorTests(unittest.TestCase):
    def setUp(self) -> None:
        self.generator = KotlinTemplateGenerator()

    def test_simple_template_generation(self):
        ts = TestSuite()
        ts.fn_name = 'sum'
        ts.description = 'calculate sum of 2 numbers'
        tree = SyntaxTree.of(['int[a]', 'int[b]', 'int'])
        self.assertEqual(textwrap.dedent('''
            /**
            * calculate sum of 2 numbers
            */
            
            class Solution {
                fun sum(a: Int, b: Int): Int {
                    //Add code here
                }
            }
            ''').lstrip(), self.generator.get_template(tree, ts))

    def test_solution_with_custom_types_generation(self):
        ts = TestSuite()
        ts.fn_name = 'sum'
        ts.description = 'calculate sum of 2 objects'
        tree = SyntaxTree.of(['object(int[a])<TypeA>[a]', 'object(int[b])<TypeB>[b]', 'int'])
        self.assertEqual(textwrap.dedent('''
            /**
            * calculate sum of 2 objects
            */
            data class TypeA(var a: Int)
            data class TypeB(var b: Int)

            class Solution {
                fun sum(a: TypeA, b: TypeB): Int {
                    //Add code here
                }
            }
            ''').lstrip(), self.generator.get_template(tree, ts))

    def test_solution_with_custom_types_double_generation(self):
        ts = TestSuite()
        ts.fn_name = 'sum'
        ts.description = 'calculate sum of 2 objects'
        tree = SyntaxTree.of(['object(int[a])<TypeA>[a]', 'TypeA[b]', 'int'])
        self.assertEqual(textwrap.dedent('''
            /**
            * calculate sum of 2 objects
            */
            data class TypeA(var a: Int)
            
            class Solution {
                fun sum(a: TypeA, b: TypeA): Int {
                    //Add code here
                }
            }
            ''').lstrip(), self.generator.get_template(tree, ts))
