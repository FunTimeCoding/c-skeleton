#!/bin/sh -e

clear
mkdir -p build
gcc -std=c99 -Wall src/main.c -o build/cs

if [ "${1}" = "--run" ]; then
    build/cs
fi
