#!/usr/bin/env bash
usage() {
    echo """
    Usage: yt2mp3
    Example: bash ex2.sh https://www.youtube.com/watch?v=FTQbiNvZqaY
    Output: {{artista}}-{{cancion}.mp3
    """
}
main() {
    local url=$1
    youtube-dl -f 'bestaudio' -o '%(artist)s.f%(title)s.mp3' $url
}
main $@