#!/bin/sh
# $1: input_file
# $2: output_file
# $3: resize
# $4: gravity
# $5: extent
# $6: background
# ref. https://blog.s0014.com/posts/2017-11-21-imagemagick/

mogrify \
-auto-orient \
-resize $3 \
-gravity $4 \
-extent $5 \
-background $6 \
$1 $2
