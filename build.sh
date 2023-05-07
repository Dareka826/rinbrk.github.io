#!/bin/sh

m4 -I ./src ./src/page.m4.html ./src/index.m4.html >./index.html

[ -d ./blog ] || mkdir ./blog
for POST in ./src/blog/*; do
    FNAME="${POST##*/}"
    FNAME="${FNAME%.m4.html}.html"

    m4 -I ./src ./src/page.m4.html "${POST}" >./blog/"${FNAME}"
done
