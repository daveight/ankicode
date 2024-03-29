# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Python implementation of the Type Mapper API
"""

from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_mapper import TypeMapper
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class PythonTypeMapper(TypeMapper):
    """
    Provides type mappings in Python.
    """

    def visit_array(self, node: SyntaxTree, context):
        """
        Python mapping for array-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python array-type declaration
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        Python mapping for list-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python list-type declaration
        """
        return 'List[' + self.render(node.first_child(), context) + ']'

    def visit_map(self, node: SyntaxTree, context):
        """
        Python mapping for map-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python map-type declaration
        """
        return render_template('Dict[{{first_type}}, {{second_type}}]',
                               first_type=self.render(node.first_child(), context),
                               second_type=self.render(node.second_child(), context))

    def visit_int(self, node: SyntaxTree, context):
        """
        Python mapping for int-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python int-type declaration
        """
        return 'int'

    def visit_long(self, node: SyntaxTree, context):
        """
        Python mapping for long-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python long-type declaration
        """
        return 'int'

    def visit_float(self, node: SyntaxTree, context):
        """
        Python mapping for float-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python float-type declaration
        """
        return 'float'

    def visit_string(self, node: SyntaxTree, context):
        """
        Python mapping for string-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python string-type declaration
        """
        return 'str'

    def visit_bool(self, node: SyntaxTree, context):
        """
        Python mapping for string-type

        :param node: target syntax tree node
        :param context: generation context
        :return: python string-type declaration
        """
        return 'bool'

    def visit_obj(self, node: SyntaxTree, context):
        """
        Python mapping for object-type. Stores type definition to the context

        :param node: target syntax tree node
        :param context: generation context
        :return: python object-type declaration
        """
        args, _ = self.get_args(node, context)
        if node.node_type not in context:
            context[node.node_type] = render_template('''
                class {{type_name}}:
                    \tdef __init__(self, {%for p in l%}{{p.name}}: {{p.type}} {%if not loop.last%},{%endif%} {%endfor%}):
                    {%for p in l %}\t\tself.{{p.name}} = {{p.name}}\n{% endfor %}
            ''', l=args, type_name=node.node_type)
        return node.node_type

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Python mapping for linked list type
        :param node: target syntax tree node
        :param context: generation context
        :return: Python linked-list type declaration
        """
        child: SyntaxTree = node.first_child()
        if node.node_type not in context:
            context[node.node_type] = '''
                T = TypeVar('T')
                
                class ListNode(Generic[T]):
                    \tdef __init__(self, data: Optional[Type[T]]=None, next: Optional=None):
                        \t\tself.data = data
                        \t\tself.next = None
                '''
        return 'ListNode[' + self.render(child, context) + ']'

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Python mapping for binary tree type
        :param node: target syntax tree node
        :param context: generation context
        :return: Python binary-tree type declaration
        """

        child: SyntaxTree = node.first_child()
        if node.node_type not in context:
            context[node.node_type] = '''
                T = TypeVar('T')

                class BinaryTreeNode(Generic[T]):
                    \tdef __init__(self, data: Optional[Type[T]]=None, left=None, right=None):
                        \t\tself.data = data
                        \t\tself.left = left
                        \t\tself.right = right
                '''
        return 'BinaryTreeNode[' + self.render(child, context) + ']'
