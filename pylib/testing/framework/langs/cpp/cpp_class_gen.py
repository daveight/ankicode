from testing.framework.langs.cpp.cpp_type_gen import CppTypeGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppClassGenerator(CppTypeGenerator):
    """
    Generates custom classes source code in java
    """

    CLASS_TEMPLATE = '''struct %(name)s {\n%(fields)s\n};'''

    def visit_obj(self, node: SyntaxTree, registry):
        """
        Generates custom class source code

        :param node: input syntax tree node
        :param registry: dictionary containing type names as keys and implementations as values
        :return: custom type's name
        """
        fields = []
        for child in node.nodes:
            fields.append([self.render(child, registry), child.name])

        fields_src = '\n'.join('\t' + field[0] + ' ' + field[1] + ';' for field in fields)
        type_src = self.CLASS_TEMPLATE % {
            'name': node.node_type,
            'fields': fields_src
        }
        type_name = node.node_type
        registry[type_name] = type_src

        return type_name
