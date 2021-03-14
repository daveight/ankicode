import subprocess
from os.path import normpath
from typing import Dict

from testing.framework.runners.code_runner import CodeRunner, create_src_file, get_resource_path, get_code_offset
from testing.framework.runners.console_logger import ConsoleLogger
from testing.framework.langs.cpp.cpp_test_suite_gen import CPP_USER_SRC_START_MARKER

#TODO: refactor runners
def strip_compile_error(error: str, file_name: str, solution_offset: int):
    """
    Parses C++ compile error log and extract the error information together with the correct line number
    :param error: target error
    :param file_name: target source code file name
    :param solution_offset: number of lines preceding solution src
    :return: text containing error with the correct line number
    """
    lines = error.split(file_name)
    text = '<span class="error">Compilation Error:</span>\n'
    for line in lines[1:]:
        splitted = line.split(':')
        line_number = int(splitted[1]) - solution_offset
        text += str(line_number) + ':' + ''.join(splitted[2:])
    return text.replace('\n', '<br>')


class CppCodeRunner(CodeRunner):
    """
    This class runs source code written in cpp
    """
    COMPILE_CMD = 'export CPATH=%(root)s/libs/clang/headers:%(root)s/libs/clang/testing_libs && %(' \
                  'root)s/libs/clang/bin/clang++ -std=c++14 -pedantic %(root)s/libs/clang/testing_libs/lib/*.cpp %(' \
                  'src)s -o %(src)s.run'

    def _run(self, src: str, logger: ConsoleLogger, messages: Dict[str, str]):
        """
        Executes python code
        :param src: input source code to be executed
        :param logger: logger to display messages in the console
        :param messages: map containing predefined messages to be displayed then a test passed or failed
        """
        workdir, srcfile = create_src_file(src, 'main.cpp')
        resource_path = get_resource_path()
        logger.log("<span class='info'>Compiling...</span>")

        solution_offset = get_code_offset(src, CPP_USER_SRC_START_MARKER)
        executable_name = srcfile.name + '.run'

        cmd = normpath(self.COMPILE_CMD % {'root': resource_path, 'src': srcfile.name, 'exec': executable_name})
        proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self._pid = proc.pid
        out, error = proc.communicate()
        if len(error) != 0:
            error_text = strip_compile_error(error.decode('utf-8'), srcfile.name, solution_offset)
            logger.log("<span class='failed'>" + error_text + '</span>')
            return False
        cmd = normpath(executable_name)
        proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self._pid = proc.pid
        for line in proc.stdout:
            if not self._set_result(line.decode("utf-8"), logger, messages):
                return False
        for error in proc.stderr:
            logger.log("<span class='failed'>error:</span>" + error.decode("utf-8"))
            return False
        return True
