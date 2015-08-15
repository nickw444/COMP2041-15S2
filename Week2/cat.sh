#!/bin/sh

for f in "$@"
do
    if [ ! -r $f ]
    then
        echo "No file Found: $f";
    else
        # File exists
        while read line
        do
            echo "$line"
        done <$f
    fi
done
