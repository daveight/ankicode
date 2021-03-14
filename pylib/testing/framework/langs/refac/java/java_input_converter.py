from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree, is_primitive_type


class JavaInputConverter(TypeConverter):
    def visit_array(self, node: SyntaxTree, context):
        child = self.render(node.first_child(), context)
        ret_type = child.ret_type
        if '[' in ret_type:
            idx = ret_type.index('[')
            ret_type = ret_type[:idx] + '[value.size()]' + ret_type[idx:]
        else:
            ret_type += '[value.size()]'
        src = render_template('''
            \t{{child.ret_type}} result[] = {{ret_type}};
            \tint i = 0;
            \tfor (JsonNode node : value) {
            \t\tresult[i++] = {{child.fn_name}}(node);
            \t}
            \treturn result;''', child=child, ret_type=ret_type)
        return ConverterFn(node.name, src, 'JsonNode', child.ret_type + '[]')

    def visit_list(self, node: SyntaxTree, context):
        child = self.render(node.first_child(), context)
        src = render_template('''
            \tList<{{child.ret_type}}> result = new ArrayList<>();
            \tfor (JsonNode node : value) {
            \t\tresult.add({{child.fn_name}}(node));
            \t}
            \treturn result;''', child=child)
        return ConverterFn(node.name, src, 'JsonNode', 'List<' + child.ret_type + '>')

    def visit_map(self, node: SyntaxTree, context):
        pass

    def visit_int(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.asInt();', 'JsonNode',
                           'int' if is_primitive_type(node) else 'Integer')

    def visit_long(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.asLong();', 'JsonNode',
                           'long' if is_primitive_type(node) else 'Long')

    def visit_float(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.asDouble();', 'JsonNode',
                           'double' if is_primitive_type(node) else 'Double')

    def visit_string(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.asText();', 'JsonNode', 'String')

    def visit_bool(self, node: SyntaxTree, context):
        return ConverterFn(node.name, 'return value.asBool();', 'JsonNode',
                           'bool' if is_primitive_type(node) else 'Boolean')

    def visit_obj(self, node: SyntaxTree, context):
        converters = [self.render(child, context) for child in node.nodes]
        src = render_template('''
            {{type_name}} result = new {{type_name}}();
            {% for c in converters %}result.{{c.prop_name}} = {{c.fn_name}}(val.get({{loop.index0}}));\n{% endfor %}
            return result;''', converters=converters, type_name=node.node_type)
        return ConverterFn(node.name, src, 'JsonNode', node.node_type)
