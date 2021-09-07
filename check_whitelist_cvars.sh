#!/bin/bash

# run: cat <cvars files> | sort | uniq | check_whitelist_cvars.sh

whitelist_file="${WHITELIST_FILE:-bspconvar_whitelist.txt}"

while read cvar
do
    if [ -z "$(grep -o -m1 -- $cvar $whitelist_file)" ]
    then
        echo "$cvar"
    fi
done < "${1:-/dev/stdin}"
