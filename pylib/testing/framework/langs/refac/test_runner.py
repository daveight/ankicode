import json
import numbers
import os
import subprocess
import sys
import tempfile
from abc import abstractmethod
from json import JSONDecodeError

from deepdiff import DeepDiff

from testing.framework.langs.refac.test_suite_gen import START_USER_SRC_MARKER
from testing.framework.langs.refac.types import SrcFile, TestStopped
from testing.framework.runners.console_logger import ConsoleLogger, TestLogger

isMac = sys.platform.startswith("darwin")
isWin = sys.platform.startswith("win32")
isLin = not isMac and not isWin

def create_src_file(src, name) -> SrcFile:
    """
    Stores the source code provided into temporary file
    :param src: target source code
    :param name: name of the file
    :return: Tuple - the file's parent dir and the target file
    """
    workdir = tempfile.TemporaryDirectory()
    src_file = open(os.path.join(workdir.name, name), 'w')
    src_file.write(src)
    src_file.close()
    return SrcFile(src, src_file, workdir)

def get_resource_path():
    """
    Returns the Resource's base path, depending on the current OS
    :return: the path of the Resources folder in the system
    """
    result = '/opt/dev/dave8/anki/testing'
    # if isWin:
    #     result = sys._MEIPASS
    # elif isMac:
    #     result = os.environ['RESOURCEPATH']
    # else:
    #     raise Exception('not supported OS')
    return '"' + result + '"'

def are_same_numbers(arg1, arg2):
    """
    Checks if both arguments are of numerical type and the delta between them is less than 1e-4
    :param arg1: first arg
    :param arg2: second arg
    :return: True - args both numbers and their values are equal, False - otherwise
    """
    if isinstance(arg1, numbers.Number) and isinstance(arg2, numbers.Number):
        if abs(arg1 - arg2) < 0.0001:
            return True

def compare(obj1, obj2) -> bool:
    """
    Performs deep difference between two objects
    :return True - if objects are equal, False otherwise
    """
    are_equal = True
    ddiff = DeepDiff(obj1, obj2, ignore_order=True)
    if 'values_changed' in ddiff:
        changed_values = ddiff['values_changed']
        for key in changed_values:
            changed_item = changed_values[key]
            new_val = changed_item['new_value']
            old_val = changed_item['old_value']
            if are_same_numbers(new_val, old_val):
                continue
            are_equal = False
            break
    if 'type_changes' in ddiff:
        changed_types = ddiff['type_changes']
        numeric_types = False
        for key in changed_types:
            changed_type = changed_types[key]
            new_val = changed_type['new_value']
            old_val = changed_type['old_value']
            if are_same_numbers(new_val, old_val):
                numeric_types = True
        if not numeric_types:
            are_equal = False
    for key in ddiff.keys():
        if not (key in ['values_changed', 'type_changes']):
            are_equal = False
    return are_equal

def get_code_offset(src: str, user_src_start_marker: str) -> int:
    """
    Returns number of lines which precede solution src
    :param src: solution src
    :param user_src_start_marker: begin of solution src marker
    """
    start_src_index = src.index(user_src_start_marker)
    return len(src[:start_src_index].split('\n'))

class TestRunner:
    def __init__(self):
        self.pid = None
        self.stopped = False

    def run(self, src_code: str, test_count: int, logger: ConsoleLogger):
        if self.pid is not None:
            raise Exception('Another test is already running ' + str(self.pid))

        resource_path = get_resource_path()
        src_file = create_src_file(src_code, self.get_src_file_name())
        test_logger = logger.get_testing_logger(test_count)
        self.stopped = False

        try:
            cmd = self.get_compile_cmd(src_file, resource_path, False)
            if cmd is not None:
                logger.info('Compiling...')
                stdout, stderr = self.exec_cmd(cmd).communicate()
                if len(stderr) > 0:
                    self.process_error(stderr.decode('utf-8'), src_file, logger)
                    return
            logger.info('Running tests...')
            cmd = self.get_run_cmd(src_file, resource_path, False)
            proc = self.exec_cmd(cmd)
            if not self.read_test_results(proc.stdout, test_logger):
                self.kill()
                return
            _, stderr = proc.communicate()
            if self.stopped:
                test_logger.cancel()
                return
            if len(stderr) > 0:
                self.process_error(stderr.decode('utf-8'), src_file, logger)
                return
            logger.log('<br/>All tests PASSED')
        except TestStopped:
            pass
        finally:
            self.stopped = True
            self.pid = None

    def exec_cmd(self, cmd: str):
        proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.pid = proc.pid
        return proc

    @abstractmethod
    def get_src_file_name(self) -> str:
        pass

    @abstractmethod
    def get_run_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        pass

    @abstractmethod
    def get_compile_cmd(self, src_file: SrcFile, resource_path: str, is_win: bool) -> str:
        pass

    @abstractmethod
    def strip_error_message(self, error: str, file_name: str, code_offset: int) -> str:
        pass

    def process_error(self, error: str, src_file: SrcFile, logger: ConsoleLogger) -> bool:
        offset = get_code_offset(src_file.text, START_USER_SRC_MARKER)
        stripped_error = self.strip_error_message(error, src_file.file.name, offset)
        if stripped_error == '':
            stripped_error = error
        stripped_error = stripped_error.replace('\n', '<br>')
        logger.error(stripped_error)

    def read_test_results(self, output, test_logger: TestLogger) -> bool:
        """
        :param output:
        :param count:
        :param logger:
        :param messages:
        :return:
        """
        for i, line in enumerate(output, start=1):
            try:
                dec_line = line.decode('utf-8')
            except AttributeError:
                return False
            try:
                tc = json.loads(dec_line)
            except JSONDecodeError:
                return False
            if compare(tc['expected'], tc['result']):
                test_logger.passed(i, tc['duration'])
            else:
                test_logger.fail(i, tc['args'], tc['expected'], tc['result'])
                return False
        return True

    def kill(self):
        if self.pid is not None:
            try:
                self.stopped = True
                os.kill(self.pid, 9)
            except:
                pass
            finally:
                self.pid = None


