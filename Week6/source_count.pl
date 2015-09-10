#!/usr/bin/perl -w
$total = 0;
foreach $file (glob("*.[ch]")) {
    open FILE, $file or die "Can't open the file $file: $!";
    @lines = <FILE>;
    $n_lines = @lines;
    printf "%7d %s\n", $n_lines, $file;
    $total += $n_lines;
    close FILE;
}
printf "%7d total\n", $total;