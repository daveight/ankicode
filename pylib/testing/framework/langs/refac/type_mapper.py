from typing import Tuple, List, Dict

from testing.framework.langs.refac.types import Arg
from testing.framework.syntax.syntax_tree import SyntaxTreeVisitor, SyntaxTree


def make_idx(start: int = 0):
    idx = start
    def counter():
        nonlocal idx
        val = idx
        idx += 1
        return val
    return counter


class TypeMapper(SyntaxTreeVisitor):
    def get_args(self, node: SyntaxTree, registry: Dict[str, str] = None) -> Tuple[List[Arg], Dict[str, str]]:
        if registry is None:
            registry = {}
        idx = make_idx()
        return [Arg(n.name if n.name else f'var{idx()}', self.render(n, registry)) for n in node.nodes], registry
