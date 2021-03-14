import json
import threading
from typing import List

import throttle

INVOCATION_LIMIT = 5
INVOCATION_DELAY_SEC = 0.1
DEBOUNCE_DELAY_SEC = 0.5


def debounce(delay):
    """
    Debounce a function's execution
    :param delay: debounce delay
    :return: decorator function
    """

    def decorate(f):
        """
        adapted decorator
        :param f: input function
        """

        def wrapped(*args, **kwargs):
            """
            wrapped function, sets timer execution for the original function,
            cancels the previous timer
            :param args: function args
            :param kwargs: function kwargs
            """
            if hasattr(decorate, 'timer'):
                decorate.timer.cancel()
            decorate.timer = threading.Timer(delay, f, args=args, kwargs=kwargs)
            decorate.timer.start()

        return wrapped

    return decorate


class TestLogger:
    def __init__(self, console, web, tests_count: int):
        self.console = console
        self.web = web
        self.progress = 0
        self.tests_count = tests_count
        self.message_buf = []
        self.valve = throttle.Valve()
        self.active = True
        self.index = 0

    def passed(self, index: int, duration_ms: int):
        self.progress = int(float(index / self.tests_count) * 100)
        self.web.eval("_setProgress(%s);" % json.dumps(str(self.progress)))
        self.log(f'Test <span class="passed">PASSED</span> ({index}/{self.tests_count}) - {duration_ms} ms<br/>')

    def fail(self, index: int, args, expected, result):
        self.web.eval("_setProgressError()")
        self.log(f'''Test <span class='failed'>FAILED</span> ({index}/{self.tests_count})<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;args: {args}<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;expected: {expected}<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;result: {result}<br/>''', flush_force=True)

    def cancel(self):
        self.web.eval("_setProgressCancelled();")
        self.console.log(f'<span class="cancel">Tests execution was interrupted.</span><br/>')
        self.message_buf.clear()

    def log(self, msg: str, flush_force: bool = False):
        self.index += 1
        self.message_buf.append(msg)
        allow = self.valve.check(INVOCATION_DELAY_SEC, INVOCATION_LIMIT, self.index)
        if flush_force or allow:
            self.flush_buffer()
        else:
            self.log_debounce()

    def flush_buffer(self):
        self.console.log(''.join(self.message_buf))
        self.message_buf.clear()

    @debounce(DEBOUNCE_DELAY_SEC)
    def log_debounce(self):
        self.flush_buffer()


class ConsoleLogger:
    """
    Used for displaying running test suites STDOUT in the UI
    """

    def __init__(self, web):
        self.web = web

    def get_testing_logger(self, tests_count: int) -> TestLogger:
        """
        Updates progress bar with the total count of tests
        :param tests_count: count of tests to be executed
        """
        return TestLogger(self, self.web, tests_count)

    def info(self, msg: str):
        self.log(f'<span class="info">{msg}</span><br/>')

    def error(self, msg: str):
        self.log(f'<span class="error">{msg}</span>')
        self.web.eval("_setProgressError();")

    def log(self, msg: str):
        self.web.eval("_showConsoleLog(%s);" % json.dumps(msg))

    def clear(self):
        self.web.eval("_cleanConsoleLog();")
        self.web.eval("_initializeProgress();")
