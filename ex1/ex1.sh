#!/usr/bin/env bash
usage() {
    echo """
    Usage: backup FILE || DIRECTORY
    Example: backup example.txt
    Output: example-1530062963.bak
    """
}
main() {
    local file=$1
    if [[ -d $file ]]; then
        local output="${file%%.*}-$(current_unix_timestamp).tar.gz"
        tar -zcf $output $file
        echo "Tar created: ${output}"
    elif [[ -f $file ]]; then
        local output="${file%%.*}-$(current_unix_timestamp).bak"
        cp ${file} ${output}
        echo "Backup created: ${output}"
    else
        echo "$file no es valido"
        exit 1
    fi
    #si no me da argumentos imprime mensaje
    [[ -z "${file}" ]] && usage && exit 1
    
}
current_unix_timestamp() {
    date +%s
}
main $@