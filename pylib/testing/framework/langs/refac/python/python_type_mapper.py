from testing.framework.langs.refac.string_utils import render_template

from testing.framework.langs.refac.type_mapper import TypeMapper
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonTypeMapper(TypeMapper):
    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        return 'List[' + self.render(node.first_child(), context) + ']'

    def visit_map(self, node: SyntaxTree, context):
        return render_template('Dict[{{first_type}}, {{second_type}}]',
                               first_type=self.render(node.first_child(), context),
                               second_type=self.render(node.second_child(), context))

    def visit_int(self, node: SyntaxTree, context):
        return 'int'

    def visit_long(self, node: SyntaxTree, context):
        return 'int'

    def visit_float(self, node: SyntaxTree, context):
        return 'float'

    def visit_string(self, node: SyntaxTree, context):
        return 'str'

    def visit_bool(self, node: SyntaxTree, context):
        return 'bool'

    def visit_obj(self, node: SyntaxTree, context):
        args, _ = self.get_args(node, context)
        context[node.node_type] = render_template('''
            class {{type_name}}:
                \tdef __init__(self, {%for p in l%}{{p.name}}: {{p.type}} {%if not loop.last%},{%endif%} {%endfor%}):
                {%for p in l %}\t\tself.{{p.name}} = {{p.name}}\n{% endfor %}
        ''', l=args, type_name=node.node_type)
        return node.node_type
