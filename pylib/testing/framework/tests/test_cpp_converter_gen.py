import unittest

from testing.framework.langs.cpp.cpp_converter_gen import CppConverterGenerator, reset_counter
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTestCaseGeneratorTest(unittest.TestCase):

    def evaluate_generator(self, type_expression, expected):
        tree = SyntaxTree.of(type_expression)
        generator = CppConverterGenerator()
        registry = []
        generator.render(tree.nodes[0], registry)
        src = '\n'.join([convert.getSrc() for convert in registry])
        self.assertEqual(src, expected)

    def setUp(self):
       reset_counter()

    def test_array_of_integers(self):
        self.evaluate_generator(['array(array(int))[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<int>> convert3(jute::jValue val) {
	vector<vector<int>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<int> obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_list_of_integer(self):
        self.evaluate_generator(['list(int)[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_array_of_integer(self):
        self.evaluate_generator(['array(int)[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_list_with_nested_array(self):
        self.evaluate_generator(['list(array(array(int)))[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<int>> convert3(jute::jValue val) {
	vector<vector<int>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<int> obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<vector<int>>> convert4(jute::jValue val) {
	vector<vector<vector<int>>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<vector<int>> obj = convert3(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_array_with_nested_list(self):
        self.evaluate_generator(['array(list(int))[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<int>> convert3(jute::jValue val) {
	vector<vector<int>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<int> obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_array_of_lists_of_arrays(self):
        self.evaluate_generator(['list(array(list(int)))[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<int>> convert3(jute::jValue val) {
	vector<vector<int>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<int> obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}

vector<vector<vector<int>>> convert4(jute::jValue val) {
	vector<vector<vector<int>>> res;
	for (int i = 0; i < val.size(); i++) {
		vector<vector<int>> obj = convert3(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_obj_simple(self):
        self.evaluate_generator(['object(int[a],int[b])<Edge>[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

int convert2(jute::jValue val) { return val.as_int(); }

Edge convert3(jute::jValue val) {
	Edge obj;
	obj.a = convert1(val[0]);
	obj.b = convert2(val[1]);
	return obj;
}''')

    def test_obj_nested_array(self):
        self.evaluate_generator(['object(array(int)[a],int[b])<Edge>[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

int convert3(jute::jValue val) { return val.as_int(); }

Edge convert4(jute::jValue val) {
	Edge obj;
	obj.a = convert2(val[0]);
	obj.b = convert3(val[1]);
	return obj;
}''')

    def test_obj_nested_list(self):
        self.evaluate_generator(['object(list(int)[a],int[b])<Edge>[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

vector<int> convert2(jute::jValue val) {
	vector<int> res;
	for (int i = 0; i < val.size(); i++) {
		int obj = convert1(val[i]);
		res.push_back(obj);
	}
	return res;
}

int convert3(jute::jValue val) { return val.as_int(); }

Edge convert4(jute::jValue val) {
	Edge obj;
	obj.a = convert2(val[0]);
	obj.b = convert3(val[1]);
	return obj;
}''')

    def test_obj_nested_object(self):
        self.evaluate_generator(['object(object(int[a])<Node>[t],int[b])<Edge>[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

Node convert2(jute::jValue val) {
	Node obj;
	obj.a = convert1(val[0]);
	return obj;
}

int convert3(jute::jValue val) { return val.as_int(); }

Edge convert4(jute::jValue val) {
	Edge obj;
	obj.t = convert2(val[0]);
	obj.b = convert3(val[1]);
	return obj;
}''')

    def test_list_of_objects(self):
        self.evaluate_generator(['list(object(int[a])<Edge>)[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

Edge convert2(jute::jValue val) {
	Edge obj;
	obj.a = convert1(val[0]);
	return obj;
}

vector<Edge> convert3(jute::jValue val) {
	vector<Edge> res;
	for (int i = 0; i < val.size(); i++) {
		Edge obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}''')

    def test_array_of_objects(self):
        self.evaluate_generator(['array(object(int[a])<Edge>)[a]'],
                                '''
int convert1(jute::jValue val) { return val.as_int(); }

Edge convert2(jute::jValue val) {
	Edge obj;
	obj.a = convert1(val[0]);
	return obj;
}

vector<Edge> convert3(jute::jValue val) {
	vector<Edge> res;
	for (int i = 0; i < val.size(); i++) {
		Edge obj = convert2(val[i]);
		res.push_back(obj);
	}
	return res;
}''')
