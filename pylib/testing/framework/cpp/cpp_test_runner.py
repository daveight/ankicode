# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
C++ Test Runner API Implementation
"""

import os
from testing.framework.test_runner import TestRunner
from testing.framework.types import SrcFile


class CppTestRunner(TestRunner):
    """
    Executes C++ test code, processes STDERR
    """

    def get_src_file_name(self) -> str:
        """
        :return: Name of the source file
        """
        return 'main.cpp'

    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        Builds a C++ execute command.

        :param src_file: target source file containing a test suite
        :param resource_path: CodeQuiz resource path
        :param is_win: True - if windows, False - if Unix/MacOS
        :return: shell command to execute a test suite
        """
        return f'{src_file.file.name}.run'

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        Builds a C++ compile command.

        :param src_file: target source file containing a test suite
        :param resource_path: CodeQuiz resource path
        :param is_win: True - if windows, False - if Unix/MacOS
        :return: shell command to compile a source file
        """
        libs_path = f'{resource_path}/cpp_lib'
        return f'export CPATH={resource_path}/libs/clang/headers:{resource_path} &&' + \
               f'{resource_path}/libs/clang/bin/clang++ -Werror=return-type -std=c++14 -pedantic ' + \
               f'{libs_path}/*.cpp {src_file.file.name} -o {src_file.file.name}.run'

    def get_error_message(self, error: str, file_name: str, code_offset: int) -> str:
        """
        Processes STDERR from C++ compiler, sets a correct line number with error in the solution src
        :param error: decoded STDERR
        :param file_name: target source file name
        :param code_offset: user solution code offset
        :return: error message
        """
        text = ''
        is_warn = False
        for error_line in error.split('\n'):
            if self.get_src_file_name() + ':' in error_line:
                is_warn = ': warning: ' in error_line
            if is_warn:
                continue
            if file_name in error_line:
                lines = error_line.split(file_name)
                for line in lines[1:]:
                    splitted = line.split(':')
                    line_number = int(splitted[1]) - code_offset
                    text += str(line_number) + ':' + ''.join(splitted[2:])
            elif not is_warn:
                text += error_line + '\n'
        return text
