#!/bin/sh -e

rm -rf build
script/check.sh --ci-mode
script/measure.sh --ci-mode
script/test.sh --ci-mode
gcc -std=c99 -Wall src/main.c -o build/cs

if [ "${1}" = --run ]; then
    build/cs
fi

#SYSTEM=$(uname)
#
# TODO: Needs polish.
#if [ "${SYSTEM}" = Linux ]; then
#    script/debian/package.sh
#    script/docker/build.sh
#fi
