from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppOutputConverter(TypeConverter):
    def visit_obj(self, node: SyntaxTree, context):
        converters, _ = self.get_converters(node, context)
        type_name = node.node_type
        src = render_template('''
            \tjute::jValue result;
            \tresult.set_type(jute::JARRAY);
            \tjute::jValue prop;
            {% for converter in converters %}
            \tprop = {{converter.fn_name}}(value.{{converter.prop_name}});
            \tresult.add_element(prop);
            {% endfor %}
            \treturn result;
            ''', type_name=type_name, converters=converters)
        return ConverterFn(node.name, src, type_name, 'jute::jValue')

    def visit_array(self, node: SyntaxTree, context):
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        converter = self.render(node.first_child(), context)
        src = render_template('''
            \tjute::jValue result; 
            \tresult.set_type(jute::JARRAY);
            \tfor (int i = 0; i < value.size(); i++) {
            \t\tresult.add_element({{converter.fn_name}}(value[i]));
            \t}
            \treturn result;''', converter=converter)
        return ConverterFn(node.name, src, 'vector<' + converter.arg_type + '>', 'jute::jValue')

    def visit_map(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        arg_type = 'map<' + converters[0].arg_type + ', ' + converters[1].arg_type + '>'
        src = render_template('''
            \tjute::jValue result;
            \tresult.set_type(jute::JARRAY);
            \tjute::jValue prop;
            \tfor (auto const& x :value) {
            \t\tresult.add_element({{converters[0].fn_name}}(x.first));
            \t\tresult.add_element({{converters[1].fn_name}}(x.second));
            \t}
            \treturn result;''', converters=converters)
        return ConverterFn(node.name, src, arg_type, 'jute::jValue')

    def visit_int(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'int', 'jute::jValue')

    def visit_long(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'long int', 'jute::jValue')

    def visit_float(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'double', 'jute::jValue')

    def visit_string(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JSTRING);
            \tresult.set_string(value);
            \treturn result;''', 'string', 'jute::jValue')

    def visit_bool(self, node: SyntaxTree, context):
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JBOOLEAN);
            \tresult.set_string(value ? "true" : "false");
            \treturn result;''', 'double', 'jute::jValue')
