from testing.framework.langs.js.js_type_gen import JsTypeGenerator
from testing.framework.syntax.syntax_tree import SyntaxTree


class JsClassGenerator(JsTypeGenerator):
    """
    Generates custom classes source code in java
    """

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

        registry[node.node_type] = '@typedef %(type_name)s\n%(fields_definition)s' % {
            'type_name': node.node_type,
            'fields_definition': '\n'.join(['@property {%(field_type)s} %(field_name)s' % {
                'field_type': field[0],
                'field_name': field[1]
            } for field in fields])
        }
        return node.node_type
