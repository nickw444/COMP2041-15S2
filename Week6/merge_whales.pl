#!/usr/bin/perl -w

$cumulaltive_count = 0;
$last_whale = "";

while ($line = <STDIN>) {
    if ($line =~ /(\d+)\s*(.+)\s*$/) {
        $count = $1;
        $whale = $2;
        if ($last_whale eq $whale) {
            $cumulaltive_count += $count
        }
        else {
            print "$cumulaltive_count $last_whale\n" if $current_count;
            $cumulaltive_count = $count;
            $last_whale = $whale;
        }
    }
    else {
        print "Sorry, couldn't parse: $line\n";
    }
}