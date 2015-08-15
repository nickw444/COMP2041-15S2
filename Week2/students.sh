#!/bin/sh
while read sid name initial
do
    mark=`grep $sid Marks | cut -d" " -f2`
    echo "$mark $name $initial"
done