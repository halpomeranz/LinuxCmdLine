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
rm -rf Pictures
mkdir -p Pictures

extensions=('png' 'png' 'png' 'png' 'png' 'jpg' 'jpg' 'jpg' 'gif' 'gif')

for i in {000..999}; do
    ext=${extensions[$(( $RANDOM % 10 ))]}

    mismatch=$ext
    if [[ $(( $RANDOM % 20 )) -eq 0 ]]; then
	mismatch=${extensions[$(( $RANDOM % 10 ))]}
	[[ $ext == $mismatch ]] && mismatch='txt'
    fi

    if [[ $ext == 'jpg' ]]; then
	[[ $(( $RANDOM % 3 )) -eq 0 ]] && ext='jpeg'
    fi

    cp "$imagedir"/*.$mismatch Pictures/$i.$ext
done

for i in {1..12}; do
    file=$(( ($RANDOM % 900) + 100 ))
    rm -f Pictures/$file.*
done
