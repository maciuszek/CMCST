#!/bin/bash -e

mapfile -t cvar_list < "${DICT_FILE:-cvar_dict.txt}"

output_file_prefex="${2:-}"
# resolve output_file before openning the file descriptor for errexit to be applied
# probably because exec forks a child process: https://tldp.org/LDP/abs/html/internal.html#EXECREF
output_file="${output_file_prefex}$(basename $1).cvars"
exec 3> $output_file

for i in ${!cvar_list[@]}
do
    # grep errexit is avoided by if handling the exit code: http://stratus3d.com/blog/2019/11/29/bash-errexit-inconsistency/
    if grep -qar -- "${cvar_list[$i]}" "$1"
    then
        echo "${cvar_list[$i]}" >&3
    fi
    
    printf "%d/%d\n" $i ${#cvar_list[@]}
done

exec 3>&-
