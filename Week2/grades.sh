#!/bin/sh
while read id mark
do
    case "$mark" in
        [0-9] |[0-4][0-9] )
            echo "$id FL" ;;
        5[0-9] | 6[0-4] )
            echo "$id PS" ;;
        .. continue this
        *) # Any case case that doesn't match the above
            echo "wut"
    esac
done