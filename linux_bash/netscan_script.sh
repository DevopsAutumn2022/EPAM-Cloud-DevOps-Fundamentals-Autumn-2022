#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo -e "This script requires one argument, got $#. Please, select one of the following:\n --all (displays the IP addresses and symbolic names of all hosts in the current subnet)\n --target (displays a list of open system TCP ports)"
  exit 1
fi

case $1 in
  --all)
    echo "You may have multiple interfaces, enter a target network (expected format - xxx.xxx.xxx.xxx/xx)"
    read cidr
    nmap -sn -PE $cidr -oG nmap_output > /dev/null 2>&1 && cat nmap_output
    ;;
  --target)
    netstat -at -n
    ;;
  *)
    echo -e "Unknow command $1. Please, select one of the following:\n --all (displays the IP addresses and symbolic names of all hosts in the current subnet)\n --target (displays a list of open system TCP ports)"
    ;;
esac
