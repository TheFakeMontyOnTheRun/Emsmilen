#!/usr/bin/env bash

deleteTemps=1
verbose=0
compile() {
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"

    if [ $verbose -eq 1 ]; then
	echo "Compiling $1 to WASM"
    fi

    emcc -Oz -g -c -o $filename.wasm $1

    if [ $verbose -eq 1 ]; then
	echo "Optimizing"
    fi
    ~/git/emsdk/binaryen/master_64bit_binaryen/bin/wasm-opt $filename.wasm --dce --directize --flatten --i64-to-i32-lowering --vacuum -o "${filename}"_opt.wasm

    if [ $verbose -eq 1 ]; then
	echo "Generating WAT"
    fi
    ~/git/emsdk/upstream/bin/wasm2wat --generate-names  "${filename}"_opt.wasm > $filename.wat

    if [ $verbose -eq 1 ]; then
	echo "Fixing format do DIS"
    fi

    ./fix.sh ./$filename.wat > ./$filename.dis

    if [ $verbose -eq 1 ]; then
	echo "Done with $1"
    fi

    if [ $deleteTemps -eq 1 ]; then
	rm $filename.wasm "${filename}"_opt.wasm $filename.wat
    fi
}

justCompile=0
customOutput=0
outputFile="a.txt"
linkerLine=""
while [ "$1" != "" ]; do
    case $1 in
        -c )                    justCompile=1
	                        if [ $customOutput -eq 1 ]; then
				    echo "select either -c or -o"
				    exit 1
				fi
                                ;;
        -k | --keep )           echo "Keeping temporaries"
	                        deleteTemps=0
                                ;;
        -v | --verbose )        verbose=1
                                ;;
        --version )             echo "wasm-sml-cc - Version 0.1 by Daniel 'MontyOnTheRun' Monteiro"
	                        exit 0
                                ;;
        -h | --help )           echo "wasm-sml-cc -c FILENAME.c or wasm-sml-cc FILENAME.c -o program.txt or even wasm-sml FILENAME.dis -o program.txt"
	                        exit 0
                                ;;

        -o )                    shift
	                        if [ $justCompile -eq 1 ]; then
				    echo "select either -c or -o"
				    exit 1
				fi

	                        outputFile=$1
				customOutput=1
                                ;;

        * )                     
	                        compile $1
				filename=$(basename -- "$1")
				filename="${filename%.*}"
				linkerLine="$linkerLine ${filename}.dis"
	                        ;;
    esac
    shift
done


if [ $justCompile -eq 0 ]; then
    python src/parse_sexpression.py $linkerLine -o $outputFile
fi