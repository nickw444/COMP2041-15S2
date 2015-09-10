#!/bin/sh

# ./rename_2041.sh file1.txt file2.txt [..]

for file in "$@"
do
    if [ -e $file ]; then
        temporary_file="$file.tmp";
        # Read into sed the original
        # Write out to temp
        sed s/2041/2042/g;s/9041/9042g $file > $temporary_file;
        # Move temp to original.
        mv $temporary_file $file;
    fi
done

perl -pi -e 's/(COMP[29]04)1)/${1}2/ig' file1 file2 ...