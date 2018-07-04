#!/usr/bin/env bash
usage() {
    echo """
    Usage: URL shortener
    Example: bash ex2.sh URL
    Output: 
    """
}
main() {
    local url=$1
    local keyword='test1'
    echo "Checking url..."
    if [ -t 0 ]; then
        if [ -z "$url" ]; then
            echo "Url not valid"
            exit 1
        fi
        echo "Creating short url..."
        url=$1;
    else
        while read -r line ; do
        url=$line
        done
    fi 
    
    echo `wget -q -O - https://u.nu/api.php?action=shorturl\&format=simple\&url=$url\&keyword=$keyword`
}
main $@
