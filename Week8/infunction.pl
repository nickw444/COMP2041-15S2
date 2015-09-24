#!/usr/bin/env perl -w

# ./myprogram <n>
$n = shift @ARGV or die "Usage: $0 <n lines>\n";

sub n_lines {
    my ($n) = @_;
    my $text = "";
    while ($n-- > 0) {
        $text .= <>;
    }
    return $text;
}

n_lines($n)