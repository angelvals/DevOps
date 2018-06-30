#!/usr/bin/env bash
usage() {
    echo """
    Usage: URL shortener
    Example: bash ex4.sh Title Artist
    Output: 
    """
}
main() {
    local title=$1
    local artist=$2
    if [[ -z "$title" ]]; then
        echo "Ingrese título de la canción"
        exit 1
    elif [[ -z "$artist" ]]; then
        echo "Ingrese artista"
        exit 1
    fi
    local url="http://www.metrolyrics.com/$title-lyrics-$artist.html"
    
    res=$(curl $url | pup --color --plain "#lyrics-body-text p text{}")
    echo $res
}
main $@