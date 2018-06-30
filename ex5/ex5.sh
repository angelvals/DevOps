#!/usr/bin/env bash
usage() {
    echo """
    Usage: API que reporte status de la máquina
    Example: bash ex5.sh
    Output: 
    """
}
main() {
    echo """
MACHINE REPORT
--------------------------------------
HOSTNAME: $(hostname)
ARQ: $(uname -m)
DISKSIZE: $(df --output=target,size /mnt/  | awk ' NR==2 { print $2 } ' | xargs -I {} echo "scale=4; {}/1024^2" | bc) GB
RAM: $(grep MemTotal /proc/meminfo | awk '{print $2}' | xargs -I {} echo "scale=4; {}/1024^2" | bc) GB
OTHER INFORMATION:

$(lscpu)
    """
}
main $@