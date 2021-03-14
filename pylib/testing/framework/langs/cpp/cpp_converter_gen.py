from testing.framework.syntax.syntax_tree import SyntaxTree, SyntaxTreeVisitor

counter = 0

def reset_counter():
    global counter
    counter = 0


class CppFunction:
    def __init__(self, type, arg, body):
        global counter
        counter += 1
        self.name = 'convert' + str(counter)
        self.type = type
        self.arg = arg
        self.body = body

    def getSrc(self):
        return '''
%(type)s %(name)s(%(arg)s val) {%(body)s}''' % {
            'name': self.name,
            'type': self.type,
            'arg': self.arg,
            'body': self.body
        }

def fn(type, arg, body, registry):
    func = CppFunction(type, arg, body)
    registry.append(func)
    return func


class CppConverterGenerator(SyntaxTreeVisitor):
    """
    Builds converter classes invocations to cast input parameters to the correct types in java.
    """


    def visit_array(self, node: SyntaxTree, registry):
        """
        Generates ArrayConverter initializer, which converts input data to java arrays
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java ArrayConverter initializer
        """
        return self.visit_list(node, registry)

    def visit_list(self, node: SyntaxTree, registry):
        """
        Generates ListConverter initializer, which converts input data to java ArrayList type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java ListConverter initializer
        """
        if len(node.nodes) != 1:
            raise Exception('arrays can have only 1 inner-type')

        child_fn = self.render(node.first_child(), registry)

        return fn('vector<%(type)s>' % { 'type': child_fn.type }, '''jute::jValue''', '''
\tvector<%(type)s> res;
\tfor (int i = 0; i < val.size(); i++) {
\t\t%(type)s obj = %(name)s(val[i]);
\t\tres.push_back(obj);
\t}
\treturn res;
''' % { 'type': child_fn.type, 'name': child_fn.name }, registry)

    def visit_map(self, node: SyntaxTree, registry):
        """
        Generates MapConverter initializer, which converts input data to java HashMap type
        :param node: target syntax tree node
        :param data: corresponding data item

        :return: java MapConverter initializer
        """
        raise Exception('Not implemented')

    def visit_int(self, node: SyntaxTree, registry):
        """
        Generates IntegerConverter initializer, which converts input data to java integer type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java IntegerConverter initializer
        """
        return fn('int', 'jute::jValue', ' return val.as_int(); ', registry)

    def visit_long(self, node: SyntaxTree, registry):
        """
        Generates LongConverter initializer, which converts input data to java integer type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java LongConverter initializer
        """
        return fn('long int', 'jute::jValue', ' return val.as_long(); ', registry)

    def visit_float(self, node: SyntaxTree, registry):
        """
        Generates DoubleConverter initializer, which converts input data to java double type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java DoubleConverter initializer
        """
        return fn('string', 'jute::jValue', ' return val.as_double(); ', registry)

    def visit_bool(self, node: SyntaxTree, registry):
        """
        Generates BoolConverter initializer, which converts input data to java boolean type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java BoolConverter initializer
        """
        return fn('bool', 'jute::jValue', ' return val.as_bool(); ', registry)

    def visit_string(self, node: SyntaxTree, registry):
        """
        Generates StringConverter initializer, which converts input data to java string type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java StringConverter initializer
        """
        return fn('string', 'jute::jValue', ' return val.as_string(); ', registry)

    def visit_obj(self, node: SyntaxTree, registry):
        """
        Generates UserTypeConverter initializer, which converts input data to user-specific java type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java UserTypeConverter initializer
        """
        return fn(node.node_type, 'jute::jValue', '''
\t%(type)s obj;
%(initializer)s
\treturn obj;
''' % {
            'type': node.node_type,
            'initializer': '\n'.join(['''\tobj.%(name)s = %(func_name)s(val[%(index)d]);''' % {
                'name': x[0].name,
                'func_name': x[1].name,
                'index': x[2]
            } for x in [(n, self.render(n, registry), i) for i, n in enumerate(node.nodes)]])
        }, registry)


class CppResultConverterGenerator(SyntaxTreeVisitor):
    """
    Builds converter classes invocations to cast input parameters to the correct types in java.
    """

    def visit_array(self, node: SyntaxTree, registry):
        """
        Generates ArrayConverter initializer, which converts input data to java arrays
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java ArrayConverter initializer
        """
        return self.visit_list(node, registry)

    def visit_list(self, node: SyntaxTree, registry):
        """
        Generates ListConverter initializer, which converts input data to java ArrayList type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java ListConverter initializer
        """
        if len(node.nodes) != 1:
            raise Exception('arrays can have only 1 inner-type')

        child = self.render(node.first_child(), registry)

        return fn('jute::jValue', 'vector<%(type)s>' % {'type': child.arg}, '''
\tjute::jValue res; 
\tres.set_type(jute::JARRAY);
\tfor (int i = 0; i < val.size(); i++) {
\t\tres.add_element(%(name)s(val[i]));
\t}
\treturn res;
''' % { 'name': child.name }, registry)

    def visit_map(self, node: SyntaxTree, data):
        """
        Generates MapConverter initializer, which converts input data to java HashMap type
        :param node: target syntax tree node
        :param data: corresponding data item

        :return: java MapConverter initializer
        """
        raise Exception('Not implemented')

    def visit_int(self, node: SyntaxTree, registry):
        """
        Generates IntegerConverter initializer, which converts input data to java integer type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java IntegerConverter initializer
        """
        return fn('jute::jValue', 'int', '''
\tjute::jValue res;
\tres.set_type(jute::JNUMBER);
\tres.set_string(std::to_string(val));
\treturn res;
''', registry)

    def visit_long(self, node: SyntaxTree, registry):
        """
        Generates LongConverter initializer, which converts input data to java integer type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java LongConverter initializer
        """
        return fn('jute::jValue', 'long int val', '''
\tjute::jValue res;
\tres.set_type(jute::JNUMBER);
\tres.set_string(std::to_string(val));
\treturn res;
''', registry)

    def visit_float(self, node: SyntaxTree, registry):
        """
        Generates DoubleConverter initializer, which converts input data to java double type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java DoubleConverter initializer
        """
        return fn('jute::jValue', 'double', '''
\tjute::jValue res;
\tres.set_type(jute::JNUMBER);
\tres.set_string(std::to_string(val));
\treturn res;
''', registry)

    def visit_bool(self, node: SyntaxTree, registry):
        """
        Generates BoolConverter initializer, which converts input data to java boolean type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java BoolConverter initializer
        """
        return fn('jute::jValue', 'bool', '''
\tjute::jValue res;
\tres.set_type(jute::JBOOLEAN);
\tres.set_string(val ? "true" : "false");
\treturn res;
''', registry)

    def visit_string(self, node: SyntaxTree, registry):
        """
        Generates StringConverter initializer, which converts input data to java string type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java StringConverter initializer
        """
        return fn('jute::jValue', 'string', '''
\tjute::jValue res;
\tres.set_type(jute::JSTRING);
\tres.set_string(val);
\treturn res;
''', registry)

    def visit_obj(self, node: SyntaxTree, registry):
        """
        Generates UserTypeConverter initializer, which converts input data to user-specific java type
        :param node: target syntax tree node
        :param data: corresponding data item
        :return: java UserTypeConverter initializer
        """
        return fn('jute::jValue', node.node_type, '''
\tjute::jValue res;
\tres.set_type(jute::JOBJECT);
\tjute::jValue prop;
%(initializer)s
\treturn res;
''' % {
        'type': node.node_type,
        'initializer': '\n'.join(['''
\tprop = %(func_name)s(val.%(name)s);
\tres.add_property("%(name)s", prop);
\t''' % {
            'name': x[0].name,
            'func_name': x[1].name,
        } for x in [(n, self.render(n, registry)) for n in node.nodes]])
        }, registry)
