import os

from testing.framework.langs.refac.test_runner import TestRunner
from testing.framework.langs.refac.types import SrcFile, Command


class CppTestRunner(TestRunner):

    def get_src_file_name(self) -> str:
        return 'main.cpp'

    def run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        return f'{src_file.file.name}.run'

    def compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        curr_path = os.path.dirname(os.path.abspath(__file__))
        libs_path = f'{curr_path}/lib'
        return f'export CPATH={resource_path}/libs/clang/headers:{curr_path} &&' + \
               f'{resource_path}/libs/clang/bin/clang++ -std=c++14 -pedantic ' + \
               f'{libs_path}/*.cpp {src_file.file.name} -o {src_file.file.name}.run'

    def strip_compile_error(self, error: str, file_name: str, code_offset: int) -> str:
        pass
# def _get_src_file_name(self) -> str:
    #     return 'main.cpp'
    #
    # def _run_cmd(self, src_file: SrcFile, logger: ConsoleLogger) -> Command:
    #     return Command(f'{src_file.file.name}.run')
    #
    # def _compile_cmd(self, src_file: SrcFile, resource_path: str) -> Command:
    #     return Command(f'export CPATH={resource_path}/libs/clang/headers:{resource_path}/libs/clang/testing_libs && ' +
    #                    f'{resource_path}/libs/clang/bin/clang++ -std=c++14 -pedantic ' +
    #                    f'{src_file.file.name} - {src_file.file.name}.run')
    #
    # def _render_error(self, error: str):
    #     pass