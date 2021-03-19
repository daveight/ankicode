from testing.framework.langs.refac.string_utils import render_template

from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree

class JsOutputConverter(TypeConverter):
    def visit_array(self, node: SyntaxTree, context):
        self.render(node.first_child(), context)
        return self.identity(node)

    def visit_list(self, node: SyntaxTree, context):
        self.render(node.first_child(), context)
        return self.identity(node)

    def visit_map(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        return ConverterFn(node.name, render_template('''
            \tvar result = []
            \tfor (var [k, v] of value) {
            \t\tresult.push({{converters[0].fn_name}}(k));
            \t\tresult.push({{converters[1].fn_name}}(v));
            \t}
            \treturn result''', converters=converters), '')

    def identity(self, node: SyntaxTree):
        return ConverterFn(node.name, 'return value', '')

    def visit_int(self, node: SyntaxTree, context):
        return self.identity(node)

    def visit_long(self, node: SyntaxTree, context):
        return self.identity(node)

    def visit_float(self, node: SyntaxTree, context):
        return self.identity(node)

    def visit_string(self, node: SyntaxTree, context):
        return self.identity(node)

    def visit_bool(self, node: SyntaxTree, context):
        return self.identity(node)

    def visit_obj(self, node: SyntaxTree, context):
        converters = [self.render(n, context) for n in node.nodes]
        return ConverterFn(node.name, render_template('''
            \tvar result = []
            {% for converter in converters %}
                \tresult.push({{converter.fn_name}}(value.{{converter.prop_name}}))
            {% endfor %}
            \treturn result''', converters=converters), '')

