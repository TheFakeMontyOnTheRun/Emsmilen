#!/usr/bin/env bash
emcc -Oz -g -c -o $1.wasm $1.c
~/git/emsdk/upstream/bin/wasm2wat --generate-names  ~/git/emfuzen/$1.wasm > $1.wat
./fix.sh ./$1.wat > ./$1.dis
