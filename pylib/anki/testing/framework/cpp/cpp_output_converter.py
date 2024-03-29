from anki.testing.framework.string_utils import render_template
from anki.testing.framework.type_converter import TypeConverter
from anki.testing.framework.types import ConverterFn
from anki.testing.framework.syntax.syntax_tree import SyntaxTree


class CppOutputConverter(TypeConverter):
    """
    Generates a C++ converter functions which convert a solution's result type to an output format.
    """

    def visit_obj(self, node: SyntaxTree, context):
        """
        object type is converted to list, only field values are put to the array:
        {
            a: 1,
            b: "2"
        } -> [1, "2"]

        :param node: source node
        :param context: generation context
        :return: converter fn
        """
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
        """
        Vector type has the same output format:
        [1,2,3] -> [1,2,3]
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return self.visit_list(node, context)

    def visit_list(self, node: SyntaxTree, context):
        """
        Vector type has the same output format:
        [1,2,3] -> [1,2,3]
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
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
        """
        Map type is converted to a vector type, so that keys are followed by values:
        {a: "1", b: "2"} -> ["a", "1", "b", "2"]

        :param node: source node
        :param context: generation context
        :return: converter fn which converts map value to array
        """
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
        """
        int type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'int', 'jute::jValue')

    def visit_long(self, node: SyntaxTree, context):
        """
        long type has the same output format:
        1 -> 1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'long int', 'jute::jValue')

    def visit_float(self, node: SyntaxTree, context):
        """
        float type has the same output format:
        1.1 -> 1.1
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JNUMBER);
            \tresult.set_string(std::to_string(value));
            \treturn result;''', 'double', 'jute::jValue')

    def visit_string(self, node: SyntaxTree, context):
        """
        string type has the same output format:
        "a" -> "a"
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JSTRING);
            \tresult.set_string(value);
            \treturn result;''', 'string', 'jute::jValue')

    def visit_bool(self, node: SyntaxTree, context):
        """
        boolean type has the same output format:
        True -> True
        no conversion is needed

        :param node: source node
        :param context: generation context
        :return: dummy converter fn
        """
        return ConverterFn(node.name, '''
            \tjute::jValue result;
            \tresult.set_type(jute::JBOOLEAN);
            \tresult.set_string(value ? "true" : "false");
            \treturn result;''', 'double', 'jute::jValue')

    def visit_linked_list(self, node: SyntaxTree, context):
        """
        Converts linked-list to a list
        linked_list(string):
        ListNode<String>() { "a", "b", "c" } -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            set<shared_ptr<ListNode<{{child.arg_type}}>>> visited;
            jute::jValue result;
            result.set_type(jute::JARRAY);
            while (value != nullptr && visited.count(value) == 0) {
            \tresult.add_element({{child.fn_name}}(value->data));
            \tvisited.insert(value);
            \tvalue = value->next;
            }
            return result;''', child=child)

        return ConverterFn(node.name, src, 'shared_ptr<ListNode<' + child.arg_type + '>>', 'jute::jValue')

    def visit_binary_tree(self, node: SyntaxTree, context):
        """
        Converts binary-tree to a list
        binary_tree(string):
        BinaryTreeNode<String>() { "a", "b", "c" } -> ["a", "b", "c"]
        """
        child = self.render(node.first_child(), context)
        src = render_template('''
            jute::jValue result;
            result.set_type(jute::JARRAY);
            queue<shared_ptr<BinaryTreeNode<{{child.arg_type}}>>> q;
            set<shared_ptr<BinaryTreeNode<{{child.arg_type}}>>> visited;
            q.push(value);
            while (!q.empty()) {
            \tshared_ptr<BinaryTreeNode<{{child.arg_type}}>> node = q.front();
            \tq.pop();
            \tif (node != nullptr) {
            \t\tvisited.insert(node);
            \t\tresult.add_element({{child.fn_name}}(node->data));
            \t} else {
            \t\tjute::jValue empty(jute::JNULL);
            \t\tresult.add_element(empty);
            \t}
            \tif (node != nullptr && visited.count(node->left) == 0) {
            \t\tq.push(node->left);
            \t}
            \tif (node != nullptr && visited.count(node->right) == 0) {
            \t\tq.push(node->right);
            \t}
            } 
            result.reduce_right();
            return result;''', child=child)
        return ConverterFn(node.name, src, 'shared_ptr<BinaryTreeNode<' + child.arg_type + '>>', 'jute::jValue')

