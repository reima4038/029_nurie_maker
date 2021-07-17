#!/bin/sh
# $1: input_file
# $2: output_file
# $3: threshold
convert -threshold $3 $1 $2
