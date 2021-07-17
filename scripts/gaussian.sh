#!/bin/sh
# $1: input_file
# $2: output_file
radius=5
sigma=5
convert $1 -gaussian-blur ${radius}x${sigma} $2