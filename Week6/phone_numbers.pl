#!/usr/bin/perl -w

foreach $url (@ARGV) {
    open F, "wget -q -o- $url|" or die;
    while ($line = <F>) {
        @numbers = split /[^\d\- ]/, $line;
        foreach $number (@numbers) {
            $number =~ s/[^0-9]//g;
            print "$number\n" if length $number >= 8 && length $number <= 15;
        }
    }
}   