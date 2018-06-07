#!/bin/bash
name=$1
if [[ -z $name ]]
  then
    echo "Hello, World!"
else
  echo "Hello, $name!"
fi