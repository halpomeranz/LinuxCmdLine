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

insertprog="$includedir/histories/insert-history"
if [[ ! -x "$insertprog" ]]; then
    echo Cannot locate $insertprog
    usage
fi

$insertprog "$includedir/histories/bash-history-lab" $HOME/.bash_history
sudo $insertprog "$includedir/histories/bash-history-root" /root/.bash_history

