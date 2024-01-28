# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Kotlin's implementation of the Type Mapper API
"""

from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_mapper import TypeMapper
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class KotlinTypeMapper(TypeMapper):
    """
    Kotlin type mapper.
    """

    def visit_array(self, node: SyntaxTree, context):
        """
        Kotlin mapping for array-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin array-type declaration
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        Kotlin mapping for list-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin list-type declaration
        """
        return 'List<' + self.render(node.first_child(), context) + '>'

    def visit_map(self, node: SyntaxTree, context):
        """
        Kotlin mapping for map-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin map-type declaration
        """
        return 'Map<' + self.render(node.first_child(), context) + ', ' \
               + self.render(node.second_child(), context) + '>'

    def visit_int(self, node: SyntaxTree, context):
        """
        Kotlin mapping for int-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin int-type declaration
        """
        return 'Int'

    def visit_long(self, node: SyntaxTree, context):
        """
        Kotlin mapping for long-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin long-type declaration
        """
        return 'Long'

    def visit_float(self, node: SyntaxTree, context):
        """
        Kotlin mapping for float-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin float-type declaration
        """
        return 'Double'

    def visit_string(self, node: SyntaxTree, context):
        """
        Kotlin mapping for string-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin string-type declaration
        """
        return 'String'

    def visit_bool(self, node: SyntaxTree, context):
        """
        Kotlin mapping for string-type

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin string-type declaration
        """
        return 'Boolean'

    def visit_obj(self, node: SyntaxTree, context):
        """
        Kotlin mapping for object-type. Stores type definition to the context

        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin object-type declaration
        """
        args, _ = self.get_args(node, context)
        if node.node_type not in context:
            context[node.node_type] = render_template('''
                data class {{type_name}}({%for a in args %}var {{a.name}}: {{a.type}}{% if not loop.last %}, {% endif %}{% endfor %})''',
                args=args, type_name=node.node_type)
        return node.node_type

    def visit_void(self, node: SyntaxTree, context):
        """
        Kotlin mapping for void-type.
        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin void-type declaration
        """
        return 'Void'

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Kotlin mapping for linked list type
        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin linked-list type declaration
        """
        child: SyntaxTree = node.first_child()
        if node.node_type not in context:
            context[node.node_type] = '''
                data class ListNode<T>(data: T, next: ListNode<T>)
            '''
        return 'ListNode<' + self.render(child, context) + '>'

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Kotlin mapping for binary tree type
        :param node: target syntax tree node
        :param context: generation context
        :return: Kotlin binary-tree type declaration
        """
        child: SyntaxTree = node.first_child()
        if node.node_type not in context:
            context[node.node_type] = '''
                data class BinaryTreeNode<T>(var data: T, var left: BinaryTreeNode<T>? = null, var right: BinaryTreeNode<T>? = null)
            '''
        return 'BinaryTreeNode<' + self.render(child, context) + '>?'
