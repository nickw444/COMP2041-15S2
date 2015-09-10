#!/bin/sh
case $# in
    1) lo=1 hi=$1 inc=1 ;;
    2) lo=$1 hi=$2 inc=1 ;;
    3) lo=$1 hi=$2 inc=$3 ;;
    *) cat <<MYCATISCOOL
Usage:
    kdfsjfhsjkh
    Put instructions in here how use the program 
    TODO
    $0 hi           
MYCATISCOOL
    exit 1 ;;
esac


i=$lo
while test $i -le $hi; do
    echo $i;
    i=`expr $i + $inc`;
done