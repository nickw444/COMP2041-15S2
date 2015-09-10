#!/usr/bin/perl -w

while ($line = <>) {
    $line =~ tr/[A-Z]/[a-z]/;
    foreach $word (split(/\s+/, $line)) {
        chomp $word;
        $word =~ s/[^a-z]//;
        $bigram_count{$last_word}{$word}++ if $last_word;
        $last_word = $word
    }
}
