# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Python Test Runner API Implementation
"""

import re
from testing.framework.test_runner import TestRunner
from testing.framework.types import SrcFile


class PythonTestRunner(TestRunner):
    """
    Executes python code, processes STDERR
    """

    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        Builds shell command to execute source file using embedded python interpreter

        :param src_file: target source file to execute
        :param resource_path: CodeQuiz resource path
        :param is_win: True - if windows, False if Unix/MacOS
        :return: shell command to execute source file
        """
        if is_win:
            cmd = f'set PYTHONPATH={resource_path}/libs/python && ' + \
                  f'{resource_path}/libs/python/Python3.7/python.exe -u {src_file.file.name}'
        else:
            cmd = f'PYTHONPATH={resource_path}/libs/python/3.9/lib/python3.9:{resource_path}' + \
                  '/libs/python/3.9/lib/python3.9/lib-dynload ' + \
                  f'{resource_path}/libs/python/3.9/bin/python3 -u {src_file.file.name}'
        return cmd

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        No compilation
        """
        pass

    def get_error_message(self, error: str, file_name: str, code_offset: int) -> str:
        """
        Processes STDERR from python process, sets a correct line number with error in the solution src
        :param error: decoded STDERR
        :param file_name: target source file name
        :param code_offset: user solution code offset
        :return: error message
        """
        line_number = None
        text = ''
        for line in error.split('\n'):
            if line_number is not None:
                line = str(line_number) + ': ' + line
            result = re.search(r'line (\d+)', line)
            if result is not None:
                line_number = int(result[1]) - code_offset
                continue
            else:
                line_number = None
            text += line + '\n'
        return text

    def get_src_file_name(self) -> str:
        """
        :return: Name of the source file
        """
        return 'test.py'
