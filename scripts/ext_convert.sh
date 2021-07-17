#!/bin/sh
# $1: input_file
# $2: output_file
ext='.png'
basename=`basename $2`
filename=${basename%.*}
output_path=`dirname $2`/${filename}${ext}
convert $1 ${output_path}