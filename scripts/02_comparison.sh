#!/bin/sh

files='../comparison/original/*'
for filepath in $files; do
  ./compare.sh `basename $filepath`
done