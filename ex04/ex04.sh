#!/bin/bash

if [ "$#" != 2 ];then
exit 1
fi

filename=$(echo $2 |cut -d '/' -f 2 )
echo $filename

grep  -n $1 $2 | cut -d ':' -f 1