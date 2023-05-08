#!/bin/sh

rm -r ./blog ./*.html

find ./src -type f | sort | while IFS= read -r SRC_FILE; do
    DESTFILE=".${SRC_FILE#./src}"
    DESTFILE="${DESTFILE%.m4.html}.html"
    DESTDIR="${DESTFILE%/*}"

    # Recreate directory structure
    [ -d "${DESTDIR}" ] || mkdir -p "${DESTDIR}"

    # Generate the page
    timeout 10s \
        m4 --nesting-limit=50 -I ./m4 ./m4/page.m4.html "${SRC_FILE}" >"${DESTFILE}"

    command -v prettier >/dev/null 2>&1 && {
        prettier --tab-width 4 --print-width 255 "${DESTFILE}" >"${DESTFILE}_prettier" && \
            cp "${DESTFILE}_prettier" "${DESTFILE}"
        rm "${DESTFILE}_prettier"
    }
done
