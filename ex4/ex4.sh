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
    local url="http://www.metrolyrics.com/$title-lyrics-$artist.html"
    
    res=$(curl $url | pup --color --plain "#lyrics-body-text p text{}")
    echo $res
}
main $@