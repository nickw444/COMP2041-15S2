#!/bin/sh

if test $# = 0
    then
    echo "Usage: $0 <files>";
    exit 1;
fi

egrep -h "^#include" "$@" |
sed 's/[">][^">]*$//' | 
sed 's/^.*["<]//' | 
sort | 
uniq
