#!/bin/sh -e

rm -rf build
script/check.sh --ci-mode
gcc -std=c99 -Wall src/main.c -o build/cs

if [ "${1}" = --run ]; then
    build/cs
fi
