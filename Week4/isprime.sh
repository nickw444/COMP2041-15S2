#!/bin/sh

if test $# != 1
    then
    echo "You stuffed up. give me 1 argument";
    exit 1;
fi

n=$1;

i=2;
while test $i -lt $n; do
    if test `expr $n % $i` -eq 0; then
        echo "$n is not prime";
        exit 1;
    fi
    i=`expr $i + 1`;
done
echo "$n is prime!";