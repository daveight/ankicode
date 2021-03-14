import re
from jinja2.nativetypes import NativeEnvironment

env = NativeEnvironment()
IDENT_TAB_SIZE = 4

def render_template(template: str, retab: bool = False, **kwargs):
    global env
    t = env.from_string(template)
    s = t.render(kwargs)
    s = re.sub(r'^\n+', '', s)
    s = re.sub(r'\n+$', '', s)
    s = '\n'.join([re.sub(r'^ +', '', l) for l in s.split('\n')])
    s = re.sub(r' +', ' ', s)
    s = re.sub(r' ,', ',', s)
    s = re.sub(r' +\)', ')', s)
    s = re.sub(r'\( +', '(', s)
    s = re.sub(r'\n{3,}', '\n\n', s)
    if retab:
        s = s.replace('\t', ' ' * IDENT_TAB_SIZE)
    return s
