import re
from typing import List

from testing.framework.langs.refac.test_runner import TestRunner
from testing.framework.langs.refac.types import SrcFile
# from typing import Tuple, List


class PythonTestRunner(TestRunner):
    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        if is_win:
            cmd = f'set PYTHONPATH={resource_path}/libs/python && ' + \
                  f'{resource_path}/libs/python/Python3.7/python.exe -u {src_file.file.name}'
        else:
            cmd = f'PYTHONPATH={resource_path}/libs/python/3.9/lib/python3.9:{resource_path}' + \
                  '/libs/python/3.9/lib/python3.9/lib-dynload ' + \
                  f'{resource_path}/libs/python/3.9/bin/python3 -u {src_file.file.name}',
        return cmd

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        pass

    def strip_error_message(self, error: str, file_name: str, code_offset: int) -> str:
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
        return 'test.py'
