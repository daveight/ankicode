from typing import List, Tuple

from testing.framework.langs.refac.types import ConverterFn
from testing.framework.syntax.syntax_tree import SyntaxTreeVisitor, SyntaxTree

class TypeConverter(SyntaxTreeVisitor):
    def get_converters(self, node: SyntaxTree, registry: List[ConverterFn] = None) -> \
            Tuple[List[ConverterFn], List[ConverterFn]]:
        if registry is None:
            registry = []
        converters = [self.render(n, registry) for n in node.nodes]
        return converters, registry

    def render(self, node: SyntaxTree, context):
        converter_fn = super().render(node, context)
        context.append(converter_fn)
        return converter_fn

