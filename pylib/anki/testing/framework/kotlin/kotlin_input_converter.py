# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Kotlin Input Converter Implementation
"""
import re
from typing import List

from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_converter import TypeConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree, is_primitive_type


class KotlinInputConverter(TypeConverter):
    """
    Generates a Kotlin converter functions which convert an input JSON arguments to a solution's typed arguments.
    """

    def visit_array(self, node: SyntaxTree, context):
        """
        Creates array, for every input element invokes inner type converter and puts it inside list
        list(map(string, string)):
        [["key1", "value1"], ["key2", "value2"]] -> Map<String, String>[]

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        Creates List, for every input element invokes inner type converter and puts it inside list
        list(map(string, string)):
        [["key1", "value1"], ["key2", "value2"]] -> List<Map<String, String>>

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            \tval result = mutableListOf<{{child.ret_type}}>()
            \tfor (node in value) {
            \t\tresult.add({{child.fn_name}}(node))
            \t}
            \treturn result''', child=child)
        return ConverterFn(node.name, src, 'JsonNode', 'List<' + child.ret_type + '>')

    def visit_map(self, node: SyntaxTree, context):
        """
        Creates a map, for every input element invokes inner type converter and puts it inside the dictionary
        map(string, string):
        ["key1", "value1", "key2", "value2"] -> Map<String, String>

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        converters = [self.render(child, context) for child in node.nodes]
        ret_type = render_template('Map<{{converters[0].ret_type}}, {{converters[1].ret_type}}>', converters=converters)
        src = render_template('''
            \tval result = mutableMapOf<{{converters[0].ret_type}}, {{converters[1].ret_type}}>()
            \tval iterator = value.iterator()
            \twhile (iterator.hasNext()) {
            \t\tval key = {{converters[0].fn_name}}(iterator.next())
            \t\tval keyVal = {{converters[1].fn_name}}(iterator.next())
            \t\tresult[key] = keyVal
            \t}
            \treturn result''', converters=converters, type_name=node.node_type, ret_type=ret_type)
        return ConverterFn(node.name, src, 'JsonNode', ret_type)

    def visit_int(self, node: SyntaxTree, context):
        """
        Converts input element to int

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return ConverterFn(node.name, 'return value.asInt()', 'JsonNode', 'Int')

    def visit_long(self, node: SyntaxTree, context):
        """
        Converts input element to long

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return ConverterFn(node.name, 'return value.asLong();', 'JsonNode', 'Long')

    def visit_float(self, node: SyntaxTree, context):
        """
        Converts input element to double

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return ConverterFn(node.name, 'return value.asDouble();', 'JsonNode', 'Double')

    def visit_string(self, node: SyntaxTree, context):
        """
        Converts input element to String

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return ConverterFn(node.name, 'return value.asText()', 'JsonNode', 'String')

    def visit_bool(self, node: SyntaxTree, context):
        """
        Converts input element to boolean

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        return ConverterFn(node.name, 'return value.asBoolean();', 'JsonNode', 'Boolean')

    def visit_obj(self, node: SyntaxTree, context):
        """
        Converts input element to a class instance [1, "2", 3] -> new SampleClass(1, "2", 3)

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        converters: List[ConverterFn] = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            return {{type_name}}({% for c in converters %}{{c.prop_name}}={{c.fn_name}}(value[{{loop.index0}}]){% if not loop.last %}, {% endif %}{% endfor %})''',
            converters=converters, type_name=node.node_type)
        return ConverterFn(node.name, src, 'JsonNode', node.node_type)

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Creates linked-list, for every input element invokes inner type converter and puts it inside linked list
        linked_list(string):
        ["a", 1, "b", 2, "c"] -> LinkedListNode("a") => LinkedListNode("b") => LinkedListNode("c")
        """

        child: ConverterFn = self.render(node.first_child(), context)
        src = render_template('''
            val nodes = mutableListOf<ListNode<{{child.ret_type}}>>()
            for (i in 0 until value.size step 2) {
            \tval n = value[i]
            \tval node = ListNode<{{child.ret_type}}>(data={{child.fn_name}}(n))
            \tnodes.add(node)
            }
            for (i in 1 until value.size() step 2) {
            \tval n = value[i]
            \tval node = nodes[(i - 1) / 2]
            \tval nextIndex = n.asInt()
            \tif (nextIndex >= 0) {
            \t\tval nextNode = nodes[nextIndex]
            \t\tnode.next = nextNode
            \t}
            }
            return if (nodes.isEmpty()) null else nodes[0]
        ''', child=child)
        return ConverterFn(node.name, src, 'JsonNode', 'ListNode<' + child.ret_type + '>')

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Creates binary-tree, for every input element invokes inner type converter and puts it inside binary tree
        binary_tree(string):
        ["a", "b", "c"] -> BinaryTreeNode<String>() { "a", left: "b", right: "c" }
        """
        child: ConverterFn = self.render(node.first_child(), context)
        src = render_template('''
            if (value.isNull()) {
                return null
            }
            val nodes = mutableListOf<BinaryTreeNode<{{child.ret_type}}>?>()
            for (n in value) {
            \tvar node: BinaryTreeNode<{{child.ret_type}}>?
            \tif (!n.isNull()) {
            \t\tnode = BinaryTreeNode<{{child.ret_type}}>({{child.fn_name}}(n))
            \t} else {
            \t\tnode = null
            \t}
            \tnodes.add(node)
            }
            val children = ArrayDeque<BinaryTreeNode<{{child.ret_type}}>?>(nodes)
            val root = children.removeFirst()
            for (node in nodes) {
            \tif (node != null) {
            \t\tif (children.isNotEmpty()) {
            \t\t\tnode.left = children.removeFirst()
            \t\t}
            \t\tif (children.isNotEmpty()) {
            \t\t\tnode.right = children.removeFirst()
            \t\t}
            \t}
            }
            
            return root
        ''', child=child)
        return ConverterFn(node.name, src, 'JsonNode', 'BinaryTreeNode<' + child.ret_type + '>?')
