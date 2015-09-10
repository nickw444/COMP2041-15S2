#!/usr/bin/perl -w

die "Usage: $0 <f1> <f2>\n" if @ARGV != 2;

open(F, "$ARGV[0]") || die("Can't open $ARGV[0]: $!");
while ($word = <F>) {
    chomp($word);
    $w{$word} = "added";
}
close(F);

open(F, "$ARGV[1]") || die("Can't open $ARGV[1]: $!");
while ($word = <F>) {
    chomp($word);
    $w{$word} = "deleted";
}

close(F);
foreach $word (sort keys %w) {
    print "$word\n" if $w{$word} ne "deleted";
}
