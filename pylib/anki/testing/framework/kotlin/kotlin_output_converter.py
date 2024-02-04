# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Kotlin Output Converter Implementation
"""
from anki.testing.framework.java.java_input_converter import generate_array_declaration
from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_converter import TypeConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree, is_primitive_type


class KotlinOutputConverter(TypeConverter):
    """
    Generates a Kotlin converter functions which convert a solution's result type to an output format.
    """

    def visit_array(self, node: SyntaxTree, context):
        """
        Array type has the same output format:
        [1,2,3] -> [1,2,3]

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        List type has the same output format:
        [1,2,3] -> [1,2,3]

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            \tval result = mutableListOf<{{child.ret_type}}>()
            \tfor (item in value) {
            \t\tresult.add({{child.fn_name}}(item))
            \t}
            \treturn result''', child=child)
        return ConverterFn(node.name, src, 'List<' + child.arg_type + '>', 'List<' + child.ret_type + '>')

    def visit_map(self, node: SyntaxTree, context):
        """
        Map type is converted to a List, so that keys are followed by values:
        {a: "1", b: "2"} -> ["a", "1", "b", "2"]

        :param node: source node
        :param context: generation context
        :return: converter fn which converts map value to array
        """
        converters = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            \tval result = mutableListOf<Any>()
            \tfor (entry in value.entries) {
            \t\tresult.add({{converters[0].fn_name}}(entry.key))
            \t\tresult.add({{converters[1].fn_name}}(entry.value))
            \t}
            return result''', converters=converters)
        arg_type = 'Map<' + converters[0].arg_type + ', ' + converters[1].arg_type + '>'
        return ConverterFn(node.name, src, arg_type, 'List<Any>')

    def visit_int(self, node: SyntaxTree, context):
        """
        int type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, 'return value', 'Int', 'Int')

    def visit_long(self, node: SyntaxTree, context):
        """
        long type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, 'return value', 'Long', 'Long')

    def visit_float(self, node: SyntaxTree, context):
        """
        float type has the same output format:
        1.1 -> 1.1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, 'return value', 'Double', 'Double')

    def visit_string(self, node: SyntaxTree, context):
        """
        string type has the same output format:
        "a" -> "a"
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, 'return value', 'String', 'String')

    def visit_bool(self, node: SyntaxTree, context):
        """
        boolean type has the same output format:
        True -> True
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, 'return value', 'Boolean', 'Boolean')

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
        converters = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            \tval result = mutableListOf<Any>()
            {% for converter in converters %}
                \tresult.add({{converter.fn_name}}(value.{{converter.prop_name}}))
            {% endfor %}
            return result''', converters=converters)
        return ConverterFn(node.name, src, node.node_type, 'List<Any>')

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Converts linked-list to a list
        linked_list(string):
        LinkedListNode("a") => LinkedListNode("b") => LinkedListNode("c") -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            var v = value
            val visited = mutableSetOf<ListNode<{{child.arg_type}}>>()
            val result = mutableListOf<Any>()
            while (v != null && !visited.contains(v)) {
            \tresult.add({{child.fn_name}}(v.data))
            \tvisited.add(v)
            \tv = v.next
            }
            return result''', child=child)

        return ConverterFn(node.name, src, 'ListNode<' + child.arg_type + '>?', 'List<Any>')

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Converts binary-tree to a list
        binary_tree(string):
        BinaryTreeNode<String>() { "a", left: "b", right: "c" } -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            if (value == null) {
                return emptyList()
            }
            val result = mutableListOf<{{child.ret_type}}?>()
            val queue = LinkedList<BinaryTreeNode<{{child.arg_type}}>?>()
            val visited = mutableSetOf<BinaryTreeNode<{{child.arg_type}}>>()
            queue.add(value)
            while (!queue.isEmpty()) {
            \tval node = queue.poll()
            \tif (node != null) {
            \t\tvisited.add(node)
            \t\tresult.add({{child.fn_name}}(node.data))
            \t} else {
            \t\tresult.add(null)
            \t}
            \tif (node != null && !visited.contains(node.left)) {
            \t\tqueue.add(node.left)
            \t}
            \tif (node != null && !visited.contains(node.right)) {
            \t\tqueue.add(node.right)
            \t}
            }
            for (i in result.size - 1 downTo 0) {
            \tif (result[i] == null) {
            \t\tresult.removeAt(i)
            \t} else {
            \t\tbreak
            \t}
            }
            return result''', child=child)
        return ConverterFn(node.name, src, 'BinaryTreeNode<' + child.arg_type + '>?', 'List<' + child.ret_type + '?>')
