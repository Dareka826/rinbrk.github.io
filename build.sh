#!/bin/sh

m4 -I ./src ./src/page_common.m4.html ./src/index.m4.html ./src/page.m4.html >./index.html
