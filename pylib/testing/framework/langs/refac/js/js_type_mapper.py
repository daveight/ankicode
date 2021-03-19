from testing.framework.langs.refac.string_utils import render_template

from testing.framework.langs.refac.type_mapper import TypeMapper
from testing.framework.syntax.syntax_tree import SyntaxTree

class JsTypeMapper(TypeMapper):
    def visit_int(self, node: SyntaxTree, context):
        return 'number'

    def visit_long(self, node: SyntaxTree, context):
        return self.visit_int(node, context)

    def visit_float(self, node: SyntaxTree, context):
        return self.visit_int(node, context)

    def visit_array(self, node: SyntaxTree, context):
        return self.render(node.first_child(), context) + '[]'

    def visit_map(self, node: SyntaxTree, context):
        return 'Map.<' + self.render(node.nodes[0], context) + ', ' + self.render(node.nodes[1], context) + '>'

    def visit_string(self, node: SyntaxTree, context):
        return 'string'

    def visit_bool(self, node: SyntaxTree, context):
        return 'bool'

    def visit_void(self, node: SyntaxTree, context):
        return ''

    def visit_list(self, node: SyntaxTree, context):
        return self.render(node.first_child(), context) + '[]'

    def visit_obj(self, node: SyntaxTree, context):
        props, _ = self.get_args(node, context)
        context[node.node_type] = render_template('''
            * @typedef {{type_name}}
            {% for p in props %}* @property { {{p.type}} } {{p.name}}
            {% endfor %}''', props=props, type_name=node.node_type)
        return node.node_type
