from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_mapper import TypeMapper
from testing.framework.syntax.syntax_tree import SyntaxTree


class JavaTypeMapper(TypeMapper):
    def visit_array(self, node: SyntaxTree, context):
        return self.render(node.first_child(), context) + '[]'

    def visit_list(self, node: SyntaxTree, context):
        return 'List<' + self.render(node.first_child(), context) + '>'

    def visit_map(self, node: SyntaxTree, context):
        return 'Map<' + self.render(node.first_child(), context) + ',' + self.render(node.second_child(), context) + '>'

    def visit_int(self, node: SyntaxTree, context):
        if node.parent.is_root() or node.parent.is_array_type() or node.parent.user_type:
            return 'int'
        elif node.parent.is_container_type():
            return 'Integer'
        else:
            raise Exception('not supported parent type for int')

    def visit_long(self, node: SyntaxTree, context):
        if node.parent.is_root() or node.parent.is_array_type() or node.parent.user_type:
            return 'long'
        elif node.parent.is_container_type():
            return 'Long'
        else:
            raise Exception('not supported parent type for long')

    def visit_float(self, node: SyntaxTree, context):
        if node.parent.is_root() or node.parent.is_array_type() or node.parent.user_type:
            return 'double'
        elif node.parent.is_container_type():
            return 'Double'
        else:
            raise Exception('not supported parent type for float')

    def visit_string(self, node: SyntaxTree, context):
        return 'String'

    def visit_bool(self, node: SyntaxTree, context):
        if node.parent.is_root() or node.parent.is_array_type() or node.parent.user_type:
            return 'boolean'
        elif node.parent.is_container_type():
            return 'Boolean'
        else:
            raise Exception('not supported parent type for int')

    def visit_obj(self, node: SyntaxTree, context):
        args, _ = self.get_args(node, context)
        context[node.node_type] = render_template('''
            \tpublic static class {{type_name}} {
                {%for a in args %}\t\t{{a.type}} {{a.name}};\n{% endfor %}\t}
            ''', args=args, type_name=node.node_type)
        return node.node_type
