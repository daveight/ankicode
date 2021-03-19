from testing.framework.langs.refac.test_runner import TestRunner
from testing.framework.langs.refac.types import SrcFile


class JsTestRunner(TestRunner):
    def get_src_file_name(self) -> str:
        return 'test.js'

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        pass

    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        return f'{resource_path}/libs/node/bin/node {src_file.file.name}'

    def strip_error_message(self, error: str, file_name: str, offset: int) -> str:
        text = ''
        for error_line in error.split('\n'):
            lines = error_line.split(file_name)
            if error_line.strip().startswith('at '):
                continue
            if len(lines) > 1:
                for line in lines[1:]:
                    splitted = line.split(':')
                    line_number = int(splitted[1]) - offset
                    text += str(line_number) + ':' + ''.join(splitted[2:])
            else:
                text += error_line + '\n'
        return text


