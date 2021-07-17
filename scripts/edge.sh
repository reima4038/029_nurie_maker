#!/bin/sh
# $1: input_file
# $2: output_file

# エッジ抽出のやり方は試行中
#convert $1 -colorspace gray -alpha remove -edge 3 -negate $2
# ref:https://www.johf.com/log/20130304b.html 
convert -segment 1x1 +dither -colors 2 -edge 2 -negate $1 $2