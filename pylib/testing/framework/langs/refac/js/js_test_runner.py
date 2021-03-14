from testing.framework.langs.refac.test_runner import TestRunner
from testing.framework.langs.refac.types import SrcFile


class JsTestRunner(TestRunner):
    def get_src_file_name(self) -> str:
        return 'test.js'

    def compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        pass

    def run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        return f'{resource_path}/libs/node/bin/node {src_file.file.name}'

    def render_compile_error(self, stderr):
        pass

