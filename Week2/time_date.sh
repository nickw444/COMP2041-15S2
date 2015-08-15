#!/bin/sh

current_month=`date | cut -d" " -f3`

while test "`date | cut -d" " -f3`" = "$current_month"
do
    date;
    sleep 3600; # seconds
done

