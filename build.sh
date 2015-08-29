#!/bin/sh -e

clear
mkdir -p build
gcc src/main.c -o build/cs

if [ "${1}" = "--run" ]; then
    build/cs
fi
