#!/bin/sh

# properties
binarization_threshold='40000'
target_file_name='karas_mascot'

# def
org_dir='../org/'
dist_dir='../dist/'

ext='.png'

org_file=${org_dir}${target_file_name}${ext}
input_file=${dist_dir}${target_file_name}${ext}
output_file=${dist_dir}${target_file_name}${ext}

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
  cp ${output_file} ${dist_dir}${target_file_name}$1${ext}
  read -p "$1 processing is done."
}

function process_single_arg() {
  # $1: process_name
  # #2: argument
  ./$1.sh $2 ${input_file} ${output_file}
  cp ${output_file} ${dist_dir}${target_file_name}$1${ext}
  read -p "$1 processing is done."
}

function directory_backup() {
  date=`date '+%Y%m%d_%H%M%S'`
  cp -r '../dist/' '../dist_'${date}
  cp -r '../bin/' '../dist_'${date}
}

# process
preprocessing

process 'gaussian'
process 'edge'
process_single_arg 'binarization' ${binarization_threshold}
process 'morphology'
process 'gaussian'
process_single_arg 'binarization' ${binarization_threshold}

directory_backup