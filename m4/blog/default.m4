dnl vim:ft=m4
include(`default.m4')

define(```_PAGE''', defn(```PAGE'''))
define(```PAGE''', ```_PAGE(```$1''', ```

$2

ifelse(REFS_TEXT, ```''', ```''', REFS_TEXT BR
BR)

<a href="/blog.html">Back to posts</a>

''')''')
