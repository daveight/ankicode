from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppInputConverter(TypeConverter):
    def visit_obj(self, node: SyntaxTree, context):
        converters, _ = self.get_converters(node, context)
        type_name = node.node_type
        src = render_template('''
            \t{{type_name}} obj;
            {% for c in converters %}\tobj.{{c.prop_name}} = {{c.fn_name}}(value[{{loop.index0}}]);{% endfor %}
            \treturn obj;''', type_name=type_name, converters=converters)
        return ConverterFn(node.name, src, 'jute::jValue', type_name)

    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        inner_converter = self.render(node.first_child(), context)
        src = render_template('''
            \tvector<{{converter.ret_type}}> result;
            \tfor (int i = 0; i < value.size(); i++) {
                \t\t{{converter.ret_type}} obj = {{converter.fn_name}}(value[i]);
                \t\tresult.push_back(obj);
            \t}
            \treturn result;''', converter=inner_converter)
        return ConverterFn(node.name, src, 'jute::jValue', 'vector<' + inner_converter.ret_type + '>')

    def visit_map(self, node: SyntaxTree, context):
        raise Exception('Not implemented')

    def visit_int(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.as_int();', 'jute::jValue', 'int')

    def visit_long(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.as_long();', 'jute:jValue', 'long int')

    def visit_float(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.as_double();', 'jute:jValue', 'double')

    def visit_string(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.as_double();', 'jute:jValue', 'string')

    def visit_bool(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.as_bool();', 'jute:jValue', 'bool')
