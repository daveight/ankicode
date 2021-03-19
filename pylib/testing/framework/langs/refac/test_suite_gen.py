from abc import abstractmethod
from typing import Dict, List

from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.type_converter import TypeConverter
from testing.framework.langs.refac.types import TestSuite, ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTree

START_USER_SRC_MARKER = 'begin_user_src'

class TestSuiteConverters:
    def __init__(self, converters: Dict[str, TypeConverter], tree: SyntaxTree):
        self._converters = {}
        self._registry = []
        for key in converters:
            converter = converters[key]
            result, _ = converter.get_converters(tree, self._registry)
            self._converters[key + '_args'] = result[:-1]
            self._converters[key + '_result'] = result[-1]

    def __iter__(self):
        self._iterator = iter(self._registry)
        return self

    def __next__(self):
        return next(self._iterator)

    def __len__(self):
        return len(self._registry)

    def __getattribute__(self, item):
        try:
            return object.__getattribute__(self, item)
        except AttributeError as e:
            self.e = e
            if item not in self._converters:
                raise AttributeError(e)
            return self._converters[item]

class TestSuiteGenerator:
    def __init__(self, converters: Dict[str, TypeConverter] = None, line_comment_char: str = '//'):
        self._line_comment_char = line_comment_char
        self._converters = converters

    @abstractmethod
    def _get_imports(self):
        pass

    @abstractmethod
    def _get_testing_src(self, tc: TestSuite, converters: TestSuiteConverters, solution_src: str):
        pass

    def generate_test_suite_src(self, tc: TestSuite, tree: SyntaxTree, solution_src: str):
        solution_src = self._line_comment_char + START_USER_SRC_MARKER + '\n' + solution_src
        return render_template(self._get_imports(), retab=True) + '\n' + \
               self._get_testing_src(tc, TestSuiteConverters(self._converters, tree), solution_src)
