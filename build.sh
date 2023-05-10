#!/bin/sh

rm -r ./blog ./*.html >/dev/null 2>&1 || :

find ./src -type f | sort | while IFS= read -r SRC_FILE; do
    DESTFILE=".${SRC_FILE#./src}"
    DESTFILE="${DESTFILE%.m4.html}.html"
    DESTDIR="${DESTFILE%/*}"

    # Recreate directory structure
    [ -d "${DESTDIR}" ] || mkdir -p "${DESTDIR}"

    # Check for directory-specific default file
    M4_DEFAULT_FILE="./m4/${DESTDIR}/default.m4"
    [ -f "${M4_DEFAULT_FILE}" ] || M4_DEFAULT_FILE="./m4/default.m4"

    # Generate the page
    timeout 10s \
        m4 --nesting-limit=50 -I ./m4 "${M4_DEFAULT_FILE}" "${SRC_FILE}" >"${DESTFILE}"

    command -v prettier >/dev/null 2>&1 && {
        prettier --tab-width 4 --print-width 255 "${DESTFILE}" >"${DESTFILE}_prettier" && \
            cp "${DESTFILE}_prettier" "${DESTFILE}"
        rm "${DESTFILE}_prettier"
    }
done
