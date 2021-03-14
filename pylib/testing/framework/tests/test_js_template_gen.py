import unittest

from testing.framework.dto.test_arg import TestArg
from testing.framework.dto.test_suite import TestSuite
from testing.framework.langs.js.js_template_gen import JsTemplateGenerator


class JsTemplateGenTests(unittest.TestCase):

    def test_sum_template(self):
        test_suite = TestSuite('sum')
        test_suite.test_args = [TestArg('number', 'a')]
        test_suite.description = 'calc sum'
        test_suite.result_type = 'number'
        test_suite.user_types = {}
        generator = JsTemplateGenerator()
        result = generator.generate_solution_template(test_suite)
        self.assertEqual('''/**
 * calc sum
 */

/**
 * @param {number} a
 * @return {number}
 */
function sum(a) {
    //Add code here
}''', result)

    def test_sum_template_with_user_type(self):
        test_suite = TestSuite('sum')
        test_suite.test_args = [TestArg('TypeA', 'a')]
        test_suite.description = 'calc sum'
        test_suite.result_type = 'number'
        test_suite.classes = {'TypeA': '''@typedef TypeA
@param {number} a'''}
        generator = JsTemplateGenerator()
        result = generator.generate_solution_template(test_suite)
        self.assertEqual('''/**
 * calc sum
 */
/**
 * @typedef TypeA
 * @param {number} a
 */
/**
 * @param {TypeA} a
 * @return {number}
 */
function sum(a) {
    //Add code here
}''', result)
