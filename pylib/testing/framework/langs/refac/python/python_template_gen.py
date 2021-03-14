from testing.framework.langs.refac.python.python_type_mapper import PythonTypeMapper
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.template_gen import TemplateGenerator
from testing.framework.langs.refac.types import TestSuite
from testing.framework.syntax.syntax_tree import SyntaxTree


class PythonTemplateGenerator(TemplateGenerator):
    def __init__(self):
        self.type_mapper = PythonTypeMapper()

    def get_template(self, tree: SyntaxTree, ts: TestSuite):
        args, type_defs = self.type_mapper.get_args(tree)
        return render_template('''
            {% for line in description.split('\n') %}# {{line}}\n{% endfor %}
            {% if type_defs|length > 0 %}{% for type_def in type_defs %}{{ type_def }}{% endfor %}{% endif %}
            def {{fn}}({% for a in l %}{{a.name}}: {{a.type}}{% if not loop.last %}, {% endif %}{% endfor %})->{{t}}:
            \t#Add code here
            \tpass
            ''', t=args[-1].type, l=args[:-1], fn=ts.fn_name, type_defs=type_defs.values(),
                 description=ts.description, retab=True)
