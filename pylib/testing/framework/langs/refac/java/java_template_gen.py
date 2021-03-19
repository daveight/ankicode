from testing.framework.langs.refac.java.java_type_mapper import JavaTypeMapper
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.template_gen import TemplateGenerator
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree
from testing.framework.syntax.utils import to_camel_case


class JavaTemplateGenerator(TemplateGenerator):
    def __init__(self):
        self.type_mapper = JavaTypeMapper()

    def get_template(self, tree: SyntaxTree, ts: TestSuite):
        args, type_defs = self.type_mapper.get_args(tree)
        return render_template('''
            /**
            {% for line in description.split('\n') %}* {{line}} {% endfor %}
            */
            public class Solution {
            {% if type_defs|length > 0%}{% for type_def in type_defs %}{{ type_def }}\n{% endfor %}{%endif%}\
            \tpublic {{t}} {{f}}({% for a in p %}{{a.type}} {{a.name}}{% if not loop.last %}, {% endif %}{% endfor %}) {
            \t\t//Add code here
            \t}
            }
            ''', t=args[-1].type, p=args[:-1], f=to_camel_case(ts.fn_name), type_defs=type_defs.values(),
                 description=ts.description, retab=True)