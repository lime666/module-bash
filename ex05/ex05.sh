#!/bin/bash

sum_of_all(){
shift
re1='^[0-9]+$'
re2='^-?[0-9]+([.][0-9]+)?$'
if [[ $1 =~ $re1 || $1 =~ $re2 || $1 = "" ]]; then
sum=0
for i do
sum=$(expr $sum + $i)
done
echo $sum
else
  echo "Error.." >&2; exit 1
fi
}

mean(){
shift
re1='^[0-9]+$'
re2='^-?[0-9]+([.][0-9]+)?$'
if ! [[ ($1 =~ $re1) || ($1 =~ $re2) ]]; then
  echo "Error.." >&2; exit 1
fi
for i in $*
do
temp_total=`expr $temp_total + $i`
done
echo "scale=0;$temp_total/$#" | bc
}

sum_of_even(){
shift
re1='^[0-9]+$'
re2='^-?[0-9]+([.][0-9]+)?$'
if ! [[ ($1 =~ $re1) || ($1 =~ $re2) ]]; then
  echo "Error.." >&2; exit 1
fi
for i in $*
do
tmp=$(($i%2))
if [ $tmp == 0 ]; then
sum=`expr $sum + $i`
else
sum=$(expr $sum + 0)
fi
done
echo $sum
}

sum_of_odd(){
shift
re1='^[0-9]+$'
re2='^-?[0-9]+([.][0-9]+)?$'
if ! [[ ($1 =~ $re1) || ($1 =~ $re2) ]]; then
  echo "Error.." >&2; exit 1
fi
for i do
tmp=$(($i%2))
if [ $tmp == 1 ]; then
sum=$(expr $sum + $i)
else
sum=$(expr $sum + 0)
fi
done
echo $sum
}

#MAIN PROG

case $1 in
 '-m')  mean $@ ;;
 '-s')  sum_of_all $@ ;;
 '-e')  sum_of_even $@ ;;
 '-o')         sum_of_odd $@ ;;
 *)  echo Error..
 exit 1;;
 
esac
