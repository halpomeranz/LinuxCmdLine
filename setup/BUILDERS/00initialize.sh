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

if [[ ! -d "$includedir/objects" ]]; then
    echo Cannot find "$includedir/objects"
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

cp "$includedir/objects"/* "$targetdir"
