dnl vim:ft=m4
changequote`'dnl Reset quote chars

divert(`-1') dnl Suppress output
changecom()  dnl Disable # comments

changequote(`[', `]')
changequote([```], ['''])

define(```BR''', ```<br/>''')
define(```NS''', ```&nbsp;''')
define(```SEPARATOR''', ```<hr/>''')

define(```TITLE''',   ```<div class="title">## $1</div>''')
define(```SECTION''', ```<div class="section"># $1</div>''')

define(```REF_NUM''', ```1''')
define(```REFS_TEXT''', ```''')
define(```REF''', ```
    <a href="$1">[REF_NUM]</a>
    define(```REFS_TEXT''', ifelse(REFS_TEXT, ```''', ```References:''', REFS_TEXT) BR [REF_NUM] - ```<a href="$1">$1</a>''')
    define(```REF_NUM''', eval(REF_NUM + 1))
''')

define(```CODE_SPAN''', ```<span class="code">$1</span>''')
define(```CODE_DIV''', ```<div class="code-flex"><div class="code">$1</div></div>''')

divert(```0''')dnl
