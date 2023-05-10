dnl vim:ft=html
include(`./common.m4')

define(```PAGE''', ```
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>$1</title>
        <meta charset="UTF-8">
        <link href="/style.css" rel="stylesheet">
    </head>
    <body>
        include(```./page_header.m4.html''')
        <div id="content-wrapper">
            <div id="content">
                $2
            </div>
        </div>
        include(```./page_footer.m4.html''')
    </body>
</html>
''')
