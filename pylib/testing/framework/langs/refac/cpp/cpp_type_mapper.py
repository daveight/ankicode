from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_mapper import TypeMapper
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTypeMapper(TypeMapper):
    def visit_obj(self, node: SyntaxTree, context):
        type_name = node.node_type
        props, _ = self.get_args(node, context)
        typedef = render_template(''' 
            struct {{type_name}} {
                {% for prop in props %}\t{{prop.type}} {{prop.name}};\n{% endfor %}}
            ''', type_name=type_name, props=props)
        context[type_name] = typedef
        return type_name

    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        return 'vector<' + self.render(node.first_child(), context) + '>'

    def visit_map(self, node: SyntaxTree, context):
        raise Exception('not implemented')

    def visit_int(self, node: SyntaxTree, context):
        return 'int'

    def visit_long(self, node: SyntaxTree, context):
        return 'long int'

    def visit_float(self, node: SyntaxTree, context):
        return 'double'

    def visit_string(self, node: SyntaxTree, context):
        return 'string'

    def visit_bool(self, node: SyntaxTree, context):
        return 'bool'
