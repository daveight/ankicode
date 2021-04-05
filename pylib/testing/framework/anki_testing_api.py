# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Facade API to the Testing framework which is accessed from ANKI
"""

import sys
from typing import Tuple, List, Callable, Optional
from anki.cards import Card
from aqt.utils import run_async
from testing.framework.lang_factory import get_lang_factory, AbstractLangFactory
from testing.framework.test_runner import TestRunner
from testing.framework.types import TestSuite
from testing.framework.console_logger import ConsoleLogger
from testing.framework.syntax.syntax_tree import SyntaxTree
from testing.framework.string_utils import strip_html_tags


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


def build_test_context(card: Card, lang: str) -> Tuple[SyntaxTree, TestSuite, AbstractLangFactory, List[str]]:
    """
    Builds testing context
    :param card: target card
    :param lang: target language
    :return: tuple of syntax tree, test suite, language factory and list of rows
    """
    fn_name, description, rows = parse_anki_card(card)
    factory = get_lang_factory(lang)
    if factory is None:
        raise Exception('Unknown language ' + lang)

    tree = SyntaxTree.of(rows[0].split(';'))
    ts = TestSuite()
    ts.fn_name = fn_name
    ts.description = description
    return tree, ts, factory, rows


def get_solution_template(card: Card, lang: str) -> str:
    """
    Generates test solution template for the given Card and language
    :param card: target card
    :param lang: target programming language
    :return: solution template src
    """
    tree, ts, factory, _ = build_test_context(card, lang)
    return factory.get_template_generator().get_template(tree, ts)


runner: Optional[TestRunner] = None


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

    logger.clear()
    tree, ts, factory, rows = build_test_context(card, lang)

    try:
        test_suite_gen = factory.get_test_suite_generator()
        test_suite_src = test_suite_gen.generate_test_suite_src(ts, tree, src)
        runner = factory.get_test_runner()
        runner.run(test_suite_src, rows, logger)
    except:
        logger.error("Unexpected runtime error: " + str(sys.exc_info()))
    finally:
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
        except:
            pass
