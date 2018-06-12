#!/bin/bash

if [[ $# -lt 1 ]]; then
exit 1
fi

if [[ -f $1 ]] ; then
  for i in $2 $3 $4
  do
    temp=$(grep -c "$i"  $1) 
    echo $i $temp 
    grep -n "$i" $1 |  cut -d : -f 1
  done
fi
