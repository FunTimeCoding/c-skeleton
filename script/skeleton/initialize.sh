#!/bin/sh -e

CAMEL=$(echo "${1}" | grep -E '^([A-Z]+[a-z0-9]*){2,}$') || CAMEL=''

if [ "${CAMEL}" = '' ]; then
    echo "Usage: ${0} UpperCamelCaseName"

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

DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
rm -rf script/skeleton
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(\.git|\.idea)/.*$' -exec sh -c '${1} -i -e "s/CSkeleton/${2}/g" -e "s/c-skeleton/${3}/g" "${4}"' '_' "${SED}" "${CAMEL}" "${DASH}" '{}' \;
