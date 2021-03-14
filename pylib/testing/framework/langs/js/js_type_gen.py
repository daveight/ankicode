from testing.framework.syntax.syntax_tree import SyntaxTreeVisitor, SyntaxTree


class JsTypeGenerator(SyntaxTreeVisitor):
    """
    Generates C++ type declarations
    """

    def visit_void(self, node: SyntaxTree, data):
        """
        provides c++ mapping for "void" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ void type declaration
        """
        return ''

    def visit_array(self, node: SyntaxTree, data):
        """
        provides c++ mapping for "array" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ array-type declaration List[node-type]
        """
        return self.render(node.first_child()) + '[]'

    def visit_list(self, node: SyntaxTree, data):
        """
        provides c++ mapping for "list" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ list-type declaration List[child-type]
        """
        return self.render(node.first_child(), data) + '[]'

    def visit_map(self, node, data):
        """
        provides c++ mapping for "map" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ map-type Map<key-type, value-type>
        """
        return 'Object.<' + self.render(node.nodes[0], data) + ', ' + self.render(node.nodes[1], data) + '>'

    def visit_int(self, node, data):
        """
        provides c++ mapping for "int" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ long type declaration
        """
        return 'number'

    def visit_long(self, node, data):
        """
        provides c++ mapping for "long" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ long type declaration
        """
        return 'number'

    def visit_bool(self, node, data):
        """
        provides c++ mapping for "boolean" node type, depending on parent type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ boolean type declaration
        """
        return 'boolean'

    def visit_float(self, node, data):
        """
        provides c++ mapping for "float" node type, depending on parent type
        it can be of primitive or reference type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: c++ double type declaration
        """
        return 'number'

    def visit_string(self, node, data):
        """
        provides java mapping for "String" node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: java string type declaration
        """
        return 'string'

    def visit_obj(self, node, data):
        """
        provides java mapping for object node type

        :param node: syntax tree node
        :param data: data item associated with the tree node
        :return: java object type declaration
        """
        return node.node_type
