from abc import abstractmethod

from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree


class TemplateGenerator:
    @abstractmethod
    def get_template(self, tree: SyntaxTree, ts: TestSuite):
        pass