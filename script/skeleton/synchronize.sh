#!/bin/sh -e

TARGET="${1}"

if [ "${TARGET}" = '' ]; then
    echo "Usage: ${0} TARGET"

    exit 1
fi

if [ ! -d "${TARGET}" ]; then
    echo "Target directory ${TARGET} does not exist."

    exit 1
fi

CAMEL=$(head -n1 "${TARGET}"/README.md | awk '{ print $2 }' | grep -E '^([A-Z]+[a-z0-9]*){2,}$') || CAMEL=''

if [ "${CAMEL}" = '' ]; then
    echo "Could not determine the projects name in ${TARGET}."

    exit 1
fi

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
    FIND='gfind'
else
    SED='sed'
    FIND='find'
fi

cp ./*.md "${TARGET}"
cp ./*.sh "${TARGET}"
cp .gitignore "${TARGET}"
DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
cd "${TARGET}" || exit 1
rm init-project.sh sync-project.sh
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(\.git|\.idea)/.*$' -exec sh -c '${1} -i -e "s/CSkeleton/${2}/g" -e "s/c-skeleton/${3}/g" "${4}"' '_' "${SED}" "${CAMEL}" "${DASH}" '{}' \;
