#!/bin/bash
cd /home/alexa/epam_tasks/bashtask/
if [[ $# -ne 2 ]]; then
  echo -e "This script requires two arguments, got $#. Please enter source and destination backup paths as parameters"
  exit 1

elif [[ ! -d $1 ]]; then 
  echo -e "$1: No such file or directory."
  exit 1

elif [[ ! -d $2 ]]; then
  echo -e "$2: No such directory."
  exit 1
fi

added=$(diff -q $1 $2 | grep "Only in $1"| awk -F ':' '{print "Added files: "$2}')

deleted=$(diff -q $1 $2 | grep "Only in $2"| awk -F ':' 'BEGIN {print "Deleted files:\n"} {print $2 "\n"}')


if [[ -n $added ]]; 
  then echo -e $added $(date -r ${1} +"%d/%m/%Y %H:%M:%S") "\n" >> backup.log 
  cp -r $1/* $2
fi

if [[ -n $deleted ]];
  then echo -e $deleted $(date -r ${1} +"%d/%m/%Y %H:%M:%S") "\n" >> backup.log 
  cp -r $1/* $2/
fi
