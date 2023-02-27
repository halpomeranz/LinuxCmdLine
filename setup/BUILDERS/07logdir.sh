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
[[ -z "$targetdir" ]] && targetdir="$HOME/Exercises/Targets"

imagedir=$(cd "$includedir/images"; /bin/pwd)
if [[ ! -d "$imagedir" ]]; then
    echo Cannot locate $imagedir
    usage
fi

if [[ ! -d "$targetdir" ]]; then
    echo $targetdir does not exist, creating...
    mkdir -p "$targetdir"
    if [[ ! -d "$targetdir" ]]; then
	echo Failed to create $targetdir
	usage
    fi
fi

cd "$targetdir"
rm -rf logs
mkdir -p logs
cd logs

for y in {2018..2022}; do
    for m in {01..12}; do
	for d in {01..31}; do
	    touch auth.$y$m$d
	    touch kern.$y$m$d
	    touch cron.$y$m$d
	    touch mail.$y$m$d
	done
    done
done
rm -f *0228 *0229 *0230 *0231 *1131 *0[469]31
