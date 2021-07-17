#!/bin/sh

# properties
binarization_threshold='40000'
target_file_name='karas_logo_02.jpg'

# def
org_dir='../org/'
dist_dir='../dist/'
filename=${target_file_name%.*}
ext=.${target_file_name##*.}

org_file=${org_dir}${filename}${ext}
input_file=${dist_dir}${filename}${ext}
output_file=${dist_dir}${filename}${ext}

# function

function preprocessing() {
  # clear dist dir
  rm ${dist_dir}*

  # original file backup
  cp ${org_file} ${input_file}
  read -p "ready"
}

function process() {
  # $1: process_name
  ./$1.sh ${input_file} ${output_file}
  cp ${output_file} ${dist_dir}${filename}$1${ext}
  read -p "$1 processing is done."
}

function process_single_arg() {
  # $1: process_name
  # #2: argument
  ./$1.sh $2 ${input_file} ${output_file}
  cp ${output_file} ${dist_dir}${filename}$1${ext}
  read -p "$1 processing is done."
}

function directory_backup() {
  date=`date '+%Y%m%d_%H%M%S'`
  cp -r '../dist/' '../dist_'${date}
  cp -r '../scripts/' '../dist_'${date}
}

# process
preprocessing

process 'gaussian'
process 'edge'
process_single_arg 'binarization' ${binarization_threshold}
process 'morphology'
process 'crop'
process 'ext_convert'

directory_backup