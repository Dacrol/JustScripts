#!/bin/bash

set -e

echo "creating a file to work with"
#dd if=/dev/zero of=/var/tmp/infile count=1175000
head -c 512M </dev/urandom >/var/tmp/infile

for bs in  48M 1k 2k 4k 8k 16k 32k 64k 128k 256k 512k 1M 2M 4M 8M 10M 12M 16M 24M

do
        echo "Testing block size  = $bs"
        dd if=/var/tmp/infile of=/var/tmp/outfile bs=$bs
        echo ""
done
rm /var/tmp/infile /var/tmp/outfile
