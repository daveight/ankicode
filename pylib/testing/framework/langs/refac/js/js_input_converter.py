from testing.framework.langs.refac.string_utils import render_template

from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree

class JsInputConverter(TypeConverter):
    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        child = self.render(node.first_child(), context)
        return ConverterFn(node.name, render_template('''
            \tvar res = []
            \tfor (var i = 0; i < value.length; i++) { res.push({{fn}}(value[i])) }
            \treturn res
            ''', fn=child.fn_name), '')

    def visit_map(self, node: SyntaxTree, context):
        raise Exception('to do')

    def visit_primitive(self, node: SyntaxTree):
        return ConverterFn(node.name, 'return value', '')

    def visit_int(self, node: SyntaxTree, context):
        return self.visit_primitive(node)

    def visit_long(self, node: SyntaxTree, context):
        return self.visit_primitive(node)

    def visit_float(self, node: SyntaxTree, context):
        return self.visit_primitive(node)

    def visit_string(self, node: SyntaxTree, context):
        return self.visit_primitive(node)

    def visit_bool(self, node: SyntaxTree, context):
        return self.visit_primitive(node)

    def visit_obj(self, node: SyntaxTree, context):
        converters = [self.render(n, context) for n in node.nodes]
        return ConverterFn(node.name, render_template('''
            \tvar res = {}
            {% for converter in converters %}
            \tres['{{converter.prop_name}}'] = {{converter.fn_name}}(value[{{loop.index}}])
            {% endfor %}
            \treturn res
            ''', converters=converters), '')

