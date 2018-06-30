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
    
    #res=$(curl $url | pup --color --plain "#lyrics-body-text p text{}")
    wget $url -O tmp.html
    
    res=$(cat tmp.html | pup --color --plain "#lyrics-body-text p text{}")
    head=$(cat tmp.html | pup --color --plain "title text{}")
    rm tmp.html
    if [[ -z "$res" ]]; then
        echo "Canción no encontrada"
        exit 1
    fi
    echo """
$head:

$res

source: $url
    """
}
main $@