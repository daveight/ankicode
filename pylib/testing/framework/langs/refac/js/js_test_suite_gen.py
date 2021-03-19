from testing.framework.langs.refac.js.js_input_converter import JsInputConverter
from testing.framework.langs.refac.js.js_output_converter import JsOutputConverter
from testing.framework.langs.refac.string_utils import render_template
from testing.framework.langs.refac.test_suite_gen import TestSuiteGenerator
from testing.framework.langs.refac.types import TestSuite


class JsTestSuiteGenerator(TestSuiteGenerator):
    def __init__(self):
        super().__init__({'input': JsInputConverter(), 'output': JsOutputConverter()})

    def _get_imports(self):
        return ''

    def _get_testing_src(self, ts: TestSuite, converters: TestSuiteGenerator, solution_src: str):
        return render_template('''
            const fs = require('fs');
            const readline = require('readline');
            const fileStream = fs.createReadStream('{{ts.test_cases_file}}');
            const rl = readline.createInterface({input: fileStream, crlfDelay: Infinity});
            {% for converter in converters %}
            function {{converter.fn_name}}({{converter.arg_name}}) {
            {{converter.src}}
            }
            {% endfor %}
            {{solution_src}}
            rl.on('line', function(line) {
            \tconst start = new Date().getTime();
            \tconst cols = line.split(';').map(it => JSON.parse(it))
            \tconst args = []
            {% for converter in converters.input_args %}
            \targs.push({{converter.fn_name}}(cols[{{loop.index0}}]));
            {% endfor %}
            \tconst result = {{ts.fn_name}}(...args);
            \tconst end = new Date().getTime();
            \tconsole.log(JSON.stringify({
            \t\t'expected': cols[cols.length - 1],
            \t\t'result': {{converters.output_result.fn_name}}(result),
            \t\t'args': args,
            \t\t'duration': (start-end)
            \t}));
            });
            ''', ts=ts, converters=converters, solution_src=solution_src)
