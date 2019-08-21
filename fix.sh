#!/usr/bin/env bash
cat $1 | sed 's/\;\;.*/''/'  | cat -s | sed 's/offset=/offset= 7/g' | sed 's/align=/align= 7/g'
