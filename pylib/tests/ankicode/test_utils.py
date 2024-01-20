# Copyright: Ankitects Pty Ltd and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html

import re
import unittest


def replace_whitespaces(s: str) -> str:
    return re.sub(r'\s', '', s)


class GeneratorTestCase(unittest.TestCase):
    def assertEqualsIgnoreWhiteSpaces(self, first, second, msg=None):
        self.assertEqual(replace_whitespaces(first), replace_whitespaces(second), msg)
