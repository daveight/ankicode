from testing.framework.langs.refac.cpp.cpp_type_mapper import CppTypeMapper
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.template_gen import TemplateGenerator
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree


class CppTemplateGenerator(TemplateGenerator):
    def __init__(self):
        self.type_mapper = CppTypeMapper()

    def get_template(self, tree: SyntaxTree, ts: TestSuite):
        args, type_defs = self.type_mapper.get_args(tree)
        return render_template('''
            /**
            {% for line in description.split('\n') %}* {{line}}\n{% endfor %}*/
            {% for type_def in type_defs %}{{ type_def }}{% endfor %}
            class Solution {
            public:
            \t{{type}} {{fn}}({% for a in args %}{{a.type}} {{a.name}}{% if not loop.last %}, {% endif %}{% endfor %}) {
            \t\t//Add code here
            \t}
            };''', type=args[-1].type, args=args[:-1], fn=ts.fn_name, type_defs=type_defs.values(),
                  description=ts.description, retab=True)
