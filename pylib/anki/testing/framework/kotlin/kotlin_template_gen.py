# Copyright: Daveight and contributors
# License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
"""
Kotlin Template Generator API Implementation
"""

from anki.testing.framework.kotlin.kotlin_type_mapper import KotlinTypeMapper
from anki.testing.framework.string_utils import render_template
from anki.testing.framework.template_gen import TemplateGenerator
from anki.testing.framework.types import TestSuite
from anki.testing.framework.syntax.syntax_tree import SyntaxTree
from anki.testing.framework.string_utils import to_camel_case


class KotlinTemplateGenerator(TemplateGenerator):
    """
    Generate a solution template in Kotlin.
    """

    def __init__(self):
        self.type_mapper = KotlinTypeMapper()

    def get_template(self, tree: SyntaxTree, ts: TestSuite) -> str:
        """
        Generate a solution template in Java.

        :param tree: source syntax tree
        :param ts: target test sutie
        :return: solution template source
        """
        args, type_defs = self.type_mapper.get_args(tree)
        return render_template('''
            /**
            {% for line in description.split('\n') %}* {{line}}\n{% endfor %}*/
            {% if type_defs|length > 0%}{% for type_def in type_defs %}{{ type_def }}\n{% endfor %}{%endif%}
            class Solution {
            \tfun {{f}}({% for a in p %}{{a.name}}: {{a.type}}{% if not loop.last %}, {% endif %}{% endfor %}): {{t}} {
            \t\t//Add code here
            \t}
            }
            ''', t=args[-1].type, p=args[:-1], f=to_camel_case(ts.fn_name), type_defs=type_defs.values(),
                 description=ts.description, retab=True)