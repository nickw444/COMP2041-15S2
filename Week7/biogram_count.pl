#!/usr/bin/perl -w

while ($line = <>) {
    $line =~ tr/[A-Z]/[a-z]/;
    foreach $word (split(/\s+/, $line)) {
        chomp $word;
        $word =~ s/[^a-z]//;
        print "$word\n";
    }
}