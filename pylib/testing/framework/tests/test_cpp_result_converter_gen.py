import unittest

from testing.framework.langs.cpp.cpp_converter_gen import CppResultConverterGenerator, reset_counter
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTestCaseGeneratorTest(unittest.TestCase):

    def evaluate_generator(self, type_expression, expected):
        tree = SyntaxTree.of(type_expression)
        generator = CppResultConverterGenerator()
        registry = []
        initializer = generator.render(tree.nodes[0], registry)
        src = '\n'.join([convert.getSrc() for convert in registry])
        self.assertEqual(src, expected)

    def setUp(self):
        reset_counter()

    def test_array_of_integers(self):
        self.evaluate_generator(['array(array(int))[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(vector<vector<int>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}''')

    def test_list_of_integer(self):
        self.evaluate_generator(['list(int)[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}''')

    def test_array_of_integer(self):
        self.evaluate_generator(['array(int)[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}''')

    def test_list_with_nested_array(self):
        self.evaluate_generator(['list(array(array(int)))[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(vector<vector<int>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}

jute::jValue convert4(vector<vector<vector<int>>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert3(val[i]));
	}
	return res;
}''')

    def test_array_with_nested_list(self):
        self.evaluate_generator(['array(list(int))[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(vector<vector<int>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}''')

    def test_array_of_lists_of_arrays(self):
        self.evaluate_generator(['list(array(list(int)))[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(vector<vector<int>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}

jute::jValue convert4(vector<vector<vector<int>>> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert3(val[i]));
	}
	return res;
}''')

    def test_obj_simple(self):
        self.evaluate_generator(['object(int[a],int[b])<Edge>[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert3(Edge val) {
	jute::jValue res;
	res.set_type(jute::JOBJECT);
	jute::jValue prop;

	prop = convert1(val.a);
	res.add_property("a", prop);
	

	prop = convert2(val.b);
	res.add_property("b", prop);
	
	return res;
}''')

    def test_obj_nested_array(self):
        self.evaluate_generator(['object(array(int)[a],int[b])<Edge>[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert4(Edge val) {
	jute::jValue res;
	res.set_type(jute::JOBJECT);
	jute::jValue prop;

	prop = convert2(val.a);
	res.add_property("a", prop);
	

	prop = convert3(val.b);
	res.add_property("b", prop);
	
	return res;
}''')

    def test_obj_nested_list(self):
        self.evaluate_generator(['object(list(int)[a],int[b])<Edge>[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(vector<int> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert1(val[i]));
	}
	return res;
}

jute::jValue convert3(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert4(Edge val) {
	jute::jValue res;
	res.set_type(jute::JOBJECT);
	jute::jValue prop;

	prop = convert2(val.a);
	res.add_property("a", prop);
	

	prop = convert3(val.b);
	res.add_property("b", prop);
	
	return res;
}''')

    def test_list_of_objects(self):
        self.evaluate_generator(['list(object(int[a])<Edge>)[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(Edge val) {
	jute::jValue res;
	res.set_type(jute::JOBJECT);
	jute::jValue prop;

	prop = convert1(val.a);
	res.add_property("a", prop);
	
	return res;
}

jute::jValue convert3(vector<Edge> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}''')

    def test_array_of_objects(self):
        self.evaluate_generator(['array(object(int[a])<Edge>)[a]'],
                                '''
jute::jValue convert1(int val) {
	jute::jValue res;
	res.set_type(jute::JNUMBER);
	res.set_string(std::to_string(val));
	return res;
}

jute::jValue convert2(Edge val) {
	jute::jValue res;
	res.set_type(jute::JOBJECT);
	jute::jValue prop;

	prop = convert1(val.a);
	res.add_property("a", prop);
	
	return res;
}

jute::jValue convert3(vector<Edge> val) {
	jute::jValue res; 
	res.set_type(jute::JARRAY);
	for (int i = 0; i < val.size(); i++) {
		res.add_element(convert2(val[i]));
	}
	return res;
}''')
