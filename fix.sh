#!/usr/bin/env bash
#### | sed 's/align=/align= /g'
cat $1 | sed 's/\;\;.*/''/'  | cat -s | sed 's/\.store offset=/\.mem_store /g' | sed 's/\.store/\.mem_store 0/g' | sed 's/\.load offset=/\.mem_load /g' | sed 's/\.load/\.mem_load 0/g'
