#!/bin/sh

find ./src -type f | sort | while IFS= read -r SRC_FILE; do
    DESTFILE=".${SRC_FILE#./src}"
    DESTFILE="${DESTFILE%.m4.html}.html"
    DESTDIR="${DESTFILE%/*}"

    # Recreate directory structure
    [ -d "${DESTDIR}" ] || mkdir -p "${DESTDIR}"

    # Generate the page
    m4 -I ./m4 ./m4/page.m4.html "${SRC_FILE}" >"${DESTFILE}"
done
