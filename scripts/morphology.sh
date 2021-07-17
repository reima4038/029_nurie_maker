#!/bin/sh
# $1: input_file
# $2: output_file
magick $1 -morphology Erode Diamond $2
