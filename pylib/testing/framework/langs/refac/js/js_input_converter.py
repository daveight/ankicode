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
            \tvar result = []
            \tfor (var i = 0; i < value.length; i++) { result.push({{fn}}(value[i])) }
            \treturn res
            ''', fn=child.fn_name), '')

    def visit_map(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        return ConverterFn(node.name, render_template('''
            \tvar result = new Map()
            \tfor (var i = 0; i < value.length; i += 2) {
            \t\tresult.set({{converters[0].fn_name}}(value[i]), {{converters[1].fn_name}}(value[i+1]))
            \t}
            \treturn result
        ''', converters=converters), '')

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
            \tvar result = {}
            {% for converter in converters %}
            \tresult['{{converter.prop_name}}'] = {{converter.fn_name}}(value[{{loop.index0}}])
            {% endfor %}
            \treturn result
            ''', converters=converters), '')

