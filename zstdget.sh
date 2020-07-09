#!/usr/bin/env bash

sourcehost=$1
sourcefile=$2
destfile=$3

ssh $sourcehost -x -o Compression=no -T "zstd -5 -T0 --stdout $sourcefile" | zstd -T0 -dc | pv > $destfile
