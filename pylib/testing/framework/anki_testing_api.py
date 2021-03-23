import os
import sys
import tempfile
from typing import Tuple, List, Callable

from anki.cards import Card
from aqt.utils import run_async
from testing.framework.langs.lang_factory import get_lang_factory
from testing.framework.langs.refac.types import TestSuite
from testing.framework.runners.console_logger import ConsoleLogger
from testing.framework.syntax.syntax_tree import SyntaxTree
from testing.framework.syntax.utils import strip_html_tags


def parse_anki_card(card: Card) -> Tuple[str, str, List[str]]:
    """
    extracts target function name, test description and test case rows from a card
    :param card: input card
    :return: tuple: function name, description, test case rows
    """
    note = card.note()
    model = card.model()['flds']
    # todo: come up with better solution than indexes
    description = strip_html_tags(note[model[1]['name']])
    fn_name = note[model[2]['name']]
    rows = strip_html_tags(note[model[4]['name']]).split('\n')
    return fn_name, description, rows


def get_solution_template(card: Card, lang: str) -> str:
    """
    Generates test solution template for the given Card and language
    :param card: target card
    :param lang: target programming language
    :return: solution template src
    """
    fn_name, description, rows = parse_anki_card(card)
    factory = get_lang_factory(lang)
    if factory is None:
        raise Exception('Unknown language ' + lang)

    tree = SyntaxTree.of(rows[0].split(';'))
    ts = TestSuite()
    ts.fn_name = fn_name
    ts.description = description
    return factory.get_template_generator().get_template(tree, ts)

runner = None

@run_async
def run_tests(card: Card, src: str, lang: str, logger: ConsoleLogger, fncomplete: Callable):
    """
    Executes tests for a given test suite and user code
    :param card: target card
    :param src: target solution src to be executed
    :param lang: target programming language
    :param logger: console logger
    :param fncomplete: complete callback
    """
    global runner
    if runner is not None:
        raise Exception('Cannot run tests, while another execution is active')

    fn_name, description, rows = parse_anki_card(card)
    factory = get_lang_factory(lang)
    if factory is None:
        raise Exception('Unknown language ' + lang)

    tree = SyntaxTree.of(rows[0].split(';'))
    ts = TestSuite()
    ts.fn_name = fn_name
    ts.description = description
    ts.test_cases_file = os.path.join(tempfile.mkdtemp(), 'data.csv')

    logger.clear()

    try:
        file = open(ts.test_cases_file, 'w')
        file.write('\n'.join(rows[1:]))
        file.close()

        test_suite_gen = factory.get_test_suite_generator()
        test_suite_src = test_suite_gen.generate_test_suite_src(ts, tree, src)
        runner = factory.get_test_runner()
        runner.run(test_suite_src, len(rows) - 1, logger)
    except:
        logger.error("Unexpected runtime error: " + str(sys.exc_info()))
    finally:
        os.remove(ts.test_cases_file)
        fncomplete()
        runner = None


def stop_tests():
    """
    Stop tests execution
    """
    global runner
    if runner is not None:
        try:
            runner.kill()
        except Exception:
            pass