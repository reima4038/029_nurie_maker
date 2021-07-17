#!/bin/sh
source ./config.properties

# def
target_file_name=$TARGET_FILE_NAME
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
  # プロセス名以外に引数があればパラメータとして渡す
  if test $# -gt 1 ; then
    ./$1.sh ${input_file} ${output_file} ${@:2} 
  else 
    ./$1.sh ${input_file} ${output_file}
  fi 
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
process 'binarization' $BINARIZATION_THRESHOLD
process 'morphology'
process 'crop' $CROP_RESIZE \
  $CROP_GRAVITY \
  $CROP_EXTENT \
  $CROP_BACKGROUND
process 'ext_convert'

directory_backup