#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo -e "This script requires exactly 1 argument, got $#. A logfile name as a argument is expected"
  exit 1
elif [[ ! $1 =~ ^[a-zA-Z_.1-9]+\.log$ ]]; then
  echo -e "File with extension \".log\" is required."
  exit 1
elif [[ ! -f $1 ]]; then
  echo -e "$1: No such file or directory."
  exit 1
fi

echo -e "Select an option:\n\tip - from which ip were the most requests\n\tpage - the most requested page\n\tipl - requests number from each ip\n\tpz - what non-existent pages were referred\n\tt - what time did site get the most requests\n\tbot - search bots accessed the site"
read command

case $command in
  ip)
    cat $1 | awk '{ print "\t" $1 }' | sort | uniq -c | sort -n | tail -1
    ;;
  page)
    cat $1 | awk '{ print "\t" $7 }' | sort | uniq -c | sort -n | tail -1
    ;;
  ipl)
    cat $1 | awk '{ print "\t" $1 }' | sort | uniq -c | sort -n
    ;;
  pz)
    cat $1 | awk '{ if ( $9 == 404) { print $7 } }' | sort | uniq 
    ;;
  t)
    cat $1 | awk '{ print $4 }' | awk -F ':' '{ print "\t" $2 ":00-" $2 ":59" }' | sort | uniq -c | sort -n | tail -1
    ;;
  bot)
    cat $1 | awk '{ print $1 "\t" $12 $14 $15 }' | sed -n /bot/p | sort | uniq
    ;;
  *)
    echo -e "$command: Command not found."
esac
