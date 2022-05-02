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

if [[ ! -f "$includedir/phrase_that_pays" ]]; then
    echo Cannot open "$includedir/phrase_that_pays"
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

str=''
while read line; do
    str="$str $line"
done <"$includedir/phrase_that_pays"
echo $str

cd "$targetdir"
rm -rf PtP
mkdir -p PtP
cd PtP
for word in $str; do
    mkdir $word
    len=$(echo -n $word | wc -c)
    dislen=$(( $len % (($len/2)+1) ))
    [[ $dislen -gt 0 ]] && mkdir $(echo $word | cut -c1-$dislen)
    cd $word
done
