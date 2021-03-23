from testing.framework.langs.refac.test_runner import TestRunner
from testing.framework.langs.refac.types import SrcFile

class JavaTestRunner(TestRunner):
    LIBS = [
        '/libs/jdk/lib/jackson-databind-2.11.3.jar',
        '/libs/jdk/lib/jackson-core-2.11.3.jar',
        '/libs/jdk/lib/jackson-annotations-2.11.3.jar'
    ]

    def get_src_file_name(self) -> str:
        return 'Solution.java'

    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        class_paths = (';' if is_win else ':').join([f'{resource_path}{path}' for path in self.LIBS] +
                                                    [src_file.directory.name])
        return f'{resource_path}/libs/jdk/bin/java -Xss10m -cp {class_paths} Runner'

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        class_paths = (';' if is_win else ':').join([f'{resource_path}{path}' for path in self.LIBS])
        return f'{resource_path}/libs/jdk/bin/javac -cp {class_paths} {src_file.file.name}'

    def get_error_message(self, error: str, file_name: str, offset: int) -> str:
        text = ''
        for error_line in error.split('\n'):
            if error_line.strip() == '':
                continue
            lines = error_line.split(file_name)
            if lines[0].startswith('Note:'):
                continue
            if file_name in error_line:
                for line in lines[1:]:
                    splitted = line.split(':')
                    line_number = int(splitted[1]) - offset
                    text += str(line_number) + ':' + ''.join(splitted[2:])
                text += '\n'
            else:
                text += error_line + '\n'
        return text
