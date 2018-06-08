#!/bin/bash
input=$@
IFS=' '
read -ra ADDR <<< "$input"
for i in "${ADDR[@]}"; do
  ls -R | grep "$i"
  if [[ $? -eq 1 ]]; then
    echo 'the searched PATH is unexisting'
  fi
done