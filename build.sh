#!/usr/bin/env bash
emcc -Oz -g -c -o $1.wasm $1.c
~/git/emsdk/binaryen/master_64bit_binaryen/bin/wasm-opt $1.wasm --dce --directize --flatten --i64-to-i32-lowering --vacuum -o $1_opt.wasm
~/git/emsdk/upstream/bin/wasm2wat --generate-names  ~/git/emfuzen/$1_opt.wasm > $1.wat
./fix.sh ./$1.wat > ./$1.dis
