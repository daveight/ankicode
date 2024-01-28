# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Kotlin Test Runner API Implementation
"""
import re
from anki.testing.framework.string_utils import get_line_number_prefix
from anki.testing.framework.test_runner import TestRunner, LIBS_FOLDER
from anki.testing.framework.types import SrcFile


class KotlinTestRunner(TestRunner):
    """
    Executes Kotlin test code, processes STDERR
    """

    LIBS = [
        f'/{LIBS_FOLDER}/java/custom_libs/jackson-databind-2.11.3.jar',
        f'/{LIBS_FOLDER}/java/custom_libs/jackson-core-2.11.3.jar',
        f'/{LIBS_FOLDER}/java/custom_libs/jackson-annotations-2.11.3.jar',
        f'/{LIBS_FOLDER}/kotlin/lib/kotlin-stdlib.jar',
        f'/{LIBS_FOLDER}/kotlin/lib/kotlin-stdlib-jdk8.jar',
        f'/{LIBS_FOLDER}/kotlin/lib/kotlin-reflect.jar',
    ]

    def get_src_file_name(self) -> str:
        """
        :return: Name of the source file
        """
        return 'Solution.kt'

    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        Builds a Kotlin execute command.

        :param src_file: target source file containing a test suite
        :param resource_path: AnkiCode resource path
        :param is_win: True - if windows, False - if Unix/MacOS
        :return: shell command to execute a test suite
        """
        class_paths = (';' if is_win else ':').join([f'{resource_path}{path}' for path in self.LIBS] +
                                                    [src_file.directory.name])
        java_home = f'{resource_path}/{LIBS_FOLDER}/java'  # todo win
        return f'JAVA_HOME={java_home} {java_home}/bin/java -Xss10m -cp {class_paths} Runner'

    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        """
        Builds a kotlin compile command.

        :param src_file: target source file containing a test suite
        :param resource_path: AnkiCode resource path
        :param is_win: True - if windows, False - if Unix/MacOS
        :return: shell command to compile a source file
        """
        class_paths = (';' if is_win else ':').join([f'{resource_path}{path}' for path in self.LIBS])
        java_home = f'{resource_path}/{LIBS_FOLDER}/java'  # to-do win
        return f'JAVA_HOME={java_home} {resource_path}/{LIBS_FOLDER}/kotlin/bin/kotlinc -cp {class_paths} {src_file.file.name} -d {src_file.directory.name}'

    def get_error_message(self, error: str, file_name: str, code_offset: int) -> str:
        """
        Processes STDERR from JVM compiler, sets a correct line number with error in the solution src
        :param error: decoded STDERR
        :param file_name: target source file name
        :param code_offset: user solution code offset
        :return: error message
        """
        error_pattern = r":(\d+):\d+: error: (.+?)\n"

        matches = re.findall(error_pattern, error)

        return "\n".join([f'{int(line) - code_offset}: {message}' for line, message in matches])

