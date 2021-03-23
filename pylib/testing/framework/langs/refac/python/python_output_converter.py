from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonOutputConverter(TypeConverter):
    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        child = self.render(node.first_child(), context)
        return ConverterFn(node.name, '\treturn value', 'List[' + child.ret_type + ']', 'List[' + child.ret_type + ']')

    def visit_map(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            \tresult = []
            \tfor k in value:
            \t\tresult.append({{converters[0].fn_name}}(k))
            \t\tresult.append({{converters[1].fn_name}}(value[k]))
            \treturn result''', converters=converters)
        return ConverterFn(node.name, src, 'Dict', 'List')

    def visit_int(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '\treturn value', 'int', 'int')

    def visit_long(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '\treturn value', 'int', 'int')

    def visit_float(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '\treturn value', 'float', 'float')

    def visit_string(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '\treturn value', 'str', 'str')

    def visit_bool(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '\treturn value', 'bool', 'bool')

    def identity(self, node: SyntaxTree):
        return ConverterFn(node.name, '\treturn value', '')

    def visit_obj(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            \tresult = []
            {% for converter in converters %}
                \tresult.append({{converter.fn_name}}(value.{{converter.prop_name}}))
            {% endfor %}
            \treturn result''', converters=converters)
        return ConverterFn(node.name, src, node.node_type, 'List')
