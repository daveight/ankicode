from testing.framework.dto.test_suite import TestSuite
from testing.framework.generators.template_gen import SolutionTemplateGenerator
from testing.framework.syntax.utils import trim_indent, to_snake_case


class JsTemplateGenerator(SolutionTemplateGenerator):
    """
    Produces solution function JS template
    """

    SOLUTION_TEMPLATE = '''%(comments)s
%(type_info)s
%(func_type_info)s
function %(func_name)s(%(args)s) {
\t//Add code here
}'''

    def generate_solution_template(self, ts: TestSuite) -> str:
        """
        Generates python source code template for the input test suite
        :param ts: input test suite
        :return: python source code with the solution template
        """
        comments = '/**\n' + '\n'.join([' * ' + line for line in ts.description.split('\n')]) + '\n */'
        type_info = '/**\n' + '\n'.join(' * ' + row for src in ts.classes.values() for row in src.split('\n')) + '\n */' \
            if len(ts.classes.values()) > 0 else ''
        func_type_info = '/**\n' + '\n'.join([' * @param {' + x.arg_type + '} ' + x.arg_name for x in ts.test_args])
        if ts.result_type is not None:
            func_type_info += '\n * @return {' + ts.result_type + '}'
        func_type_info += '\n */'
        args = ', '.join([x.arg_name for x in ts.test_args])
        func_name = to_snake_case(ts.func_name)

        return trim_indent(self.SOLUTION_TEMPLATE % dict(
            comments=comments,
            func_name=func_name,
            func_type_info=func_type_info,
            type_info=type_info,
            args=args))
