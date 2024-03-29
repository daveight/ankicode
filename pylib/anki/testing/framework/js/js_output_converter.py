# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
JS Output Converter Implementation
"""
from typing import List
from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_converter import TypeConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class JsOutputConverter(TypeConverter):
    """
    Generates converter functions which convert a type to a result type.
    """

    def visit_array(self, node: SyntaxTree, context):
        """
        Array type has the same output format:
        [1,2,3] -> [1,2,3]
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        List type has the same output type:
        [1,2,3] -> [1,2,3]
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        child: ConverterFn = self.render(node.first_child(), context)
        return ConverterFn(node.name, render_template('''
            \tvar result = []
            \tfor (var i = 0; i < value.length; i++) { result.push({{fn}}(value[i])) }
            \treturn result
            ''', fn=child.fn_name), '')

    def visit_map(self, node: SyntaxTree, context):
        """
        Map type is converted to a List, so that keys are followed by values:
        {a: "1", b: "2"} -> ["a", "1", "b", "2"]

        :param node: source node
        :param context: generation context
        :return: converter fn which converts map value to array
        """
        converters: List[ConverterFn] = [self.render(child, context) for child in node.nodes]
        return ConverterFn(node.name, render_template('''
            \tvar result = []
            \tfor (var [k, v] of value) {
            \t\tresult.push({{converters[0].fn_name}}(k));
            \t\tresult.push({{converters[1].fn_name}}(v));
            \t}
            \treturn result''', converters=converters), '')

    @staticmethod
    def identity(node: SyntaxTree):
        """
        Generates a dummy converter function, which returns argument
        :param node: target node
        :return: value argument
        """
        return ConverterFn(node.name, 'return value', '')

    def visit_int(self, node: SyntaxTree, context):
        """
        int type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.identity(node)

    def visit_long(self, node: SyntaxTree, context):
        """
        long type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.identity(node)

    def visit_float(self, node: SyntaxTree, context):
        """
        float type has the same output format:
        1.1 -> 1.1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.identity(node)

    def visit_string(self, node: SyntaxTree, context):
        """
        string type has the same output format:
        "a" -> "a"
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.identity(node)

    def visit_bool(self, node: SyntaxTree, context):
        """
        boolean type has the same output type:
        True -> True
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.identity(node)

    def visit_obj(self, node: SyntaxTree, context):
        """
        object type is converted to list, only field values are put to the array:
        {
            a: 1,
            b: "2"
        } -> [1, "2"]

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
        converters: List[ConverterFn] = [self.render(n, context) for n in node.nodes]
        return ConverterFn(node.name, render_template('''
            var result = []
            {% for converter in converters %}
                result.push({{converter.fn_name}}(value.{{converter.prop_name}}))
            {% endfor %}
            return result''', converters=converters), '')

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Converts linked-list to a list
        linked_list(string):
        LinkedListNode("a") => LinkedListNode("b") => LinkedListNode("c") -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            const visited = new Set()
            const result = []
            while (value != null && !visited.has(value)) {
            \tresult.push({{child.fn_name}}(value.data))
            \tvisited.add(value)
            \tvalue = value.next
            }
            return result''', child=child)

        return ConverterFn(node.name, src, '')

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Converts binary-tree to a list
        binary_tree(string):
        BinaryTreeNode<String>() { "a", left: "b", right: "c" } -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            const result = []
            const queue = []
            const visited = new Set()
            queue.push(value)
            while (queue.length) {
            \tnode = queue.shift()
            \tif (node) {
            \t\tvisited.add(node)
            \t\tresult.push({{child.fn_name}}(node.data))
            \t} else {
            \t\tresult.push(null);
            \t}
            \tif (node != null && !visited.has(node.left)) {
            \t\tqueue.push(node.left)
            \t}
            \tif (node != null && !visited.has(node.right)) {
            \t\tqueue.push(node.right)
            \t}
            }
            for (let i = result.length - 1; i > 0; i--) {
            \tif (result[i] == null) {
            \t\tresult.pop()
            \t} else {
            \t\tbreak
            \t}
            }
            return result''', child=child)
        return ConverterFn(node.name, src, '')
