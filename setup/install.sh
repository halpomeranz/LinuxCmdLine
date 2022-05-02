#!/bin/bash

exdir=$HOME/Exercises
targetdir=$exdir/Targets
thisdir=$(dirname $0)
includedir=$thisdir/BUILDERS/include

mkdir -p "$targetdir"
cp $thisdir/*.txt $exdir

for script in $thisdir/BUILDERS/[0-9]*.sh; do
    echo ===== $script
    $script -i $includedir -t $targetdir
done
