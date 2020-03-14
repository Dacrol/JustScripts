#!/bin/bash

set -e

{
if [[ -f test_dd_infile || -f test_dd_outfile ]]; then
    echo "File exists! Exiting."
    exit 1
fi
}

if [ $EUID -ne 0 ]; then
  echo "Run as sudo to clear caches between runs"
fi

echo "Creating infile"
#dd if=/dev/zero of=/var/tmp/infile count=1175000
head -c 256M </dev/urandom >test_dd_infile

for bs in  48M 1k 2k 4k 8k 16k 32k 64k 128k 256k 512k 1M 2M 4M 8M 10M 12M 16M 24M

do
        echo "Testing block size  = $bs"
        [ -e /proc/sys/vm/drop_caches ] && echo 3 > /proc/sys/vm/drop_caches
        dd if=test_dd_infile of=test_dd_outfile bs=$bs
        echo ""
done
rm test_dd_infile test_dd_outfile
