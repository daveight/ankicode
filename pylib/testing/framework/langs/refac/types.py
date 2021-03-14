import collections
import re
import tempfile
from typing import List, Dict, TextIO, Optional

from testing.framework.syntax.syntax_tree import SyntaxTreeVisitor, SyntaxTree

FuncArg = collections.namedtuple('FuncArg', ['name', 'type'])
FuncDef = collections.namedtuple('FuncDef', ['name', 'ret_type', 'args'])

class Arg:
    def __init__(self, arg_name: str, arg_type: str):
        self.name = arg_name
        self.type = arg_type

    def __eq__(self, other):
        if isinstance(other, Arg):
            return other.type == self.type and other.name == self.name
        return False

class ConverterFn:
    __counter = 0

    def __init__(self, prop_name: str, src: str, arg_type: str, ret_type: str = ''):
        ConverterFn.__counter += 1
        self.fn_name = 'converter' + str(self.__counter)
        self.prop_name = prop_name
        self.arg_type = arg_type
        self.arg_name = 'value'
        self.ret_type = ret_type
        self.src = src

    def __eq__(self, other):
        if isinstance(other, ConverterFn):
            return re.sub(r'\s', '', other.src) == re.sub(r'\s', '', self.src) \
               and other.prop_name == self.prop_name \
               and other.arg_type == self.arg_type \
               and other.ret_type == self.ret_type
        else:
            return False

    def __repr__(self):
        return "fn name: " + self.fn_name + " " +\
               "arg_type: " + self.arg_type + " " +\
               "ret_type: " + self.ret_type + " " + \
               "prop name: " + self.prop_name + " " +\
               "src: " + self.src

    @classmethod
    def reset_counter(cls):
        cls.__counter = 0

class Function:
    counter = 0
    def __init__(self, src: str, ret_type: str = None):
        Function.counter += 1
        self.name = 'converter' + str(self.counter)
        self.ret_type = ret_type
        self.src = src

    def __eq__(self, other):
        if isinstance(other, Function):
            return other.src == self.src \
                and other.ret_type == self.ret_type
        else:
            return False


class TestSuite:
    description: str
    fn_name: str
    # test_args: List[TestArg]
    # result_type: str
    # classes: Dict[str, str]
    test_cases_file: str

class Command:

    def __init__(self, unix_cmd: str, win_cmd: str = None):
        self.unix_cmd = unix_cmd
        if win_cmd is not None:
            self.win_cmd = win_cmd
        else:
            self.win_cmd = unix_cmd

class SrcFile:
    def __init__(self, text: str, file: TextIO, directory: tempfile.TemporaryDirectory):
        self.text = text
        self.file = file
        self.directory = directory

class TestStopped(Exception):
    pass
# class SyntaxTreeItem:
#     def __init__(self, name: str, type: str, src: str = None):
#         self.var_name = var_name
#         self.type_name = type_name
#         self.src = src
#
# TestSuite = collections.namedtuple('TestSuite', ['description', 'fn_def', 'type_defs',
#                                                  'test_count', 'test_file_path'])

TestCaseResponse = collections.namedtuple('TestCaseResponse', ['expected', 'result', 'args', 'duration_ms', 'index'])
