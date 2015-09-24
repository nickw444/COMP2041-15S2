#!/usr/bin/env perl -w
#include
# include
#      include
@path = ('/usr/include/', '/usr/local/include/');

sub include_files($$);
sub include_files($$) {
    my ($file, $look_in_path) = @_;
    my @mypath;
    if ($look_in_path) {
        @mypath = @path;
    }
    else {
        @mypath = ('./');
    }

    foreach $location (@mypath) {
        my $file_location = "$location$file";
        next if !-r $file_location;
        open my $f, "<$file_location" or die "$0: can't open $path: $!";
        while ($line = <$f>) {
            if ($line =~ /^#\s*include\s+"([^"]*)"/) {
                include_files($1, 0);
            } elsif ($line =~ /^#\s*include\s+<(.*)>/ ) {
                include_files($1, 1);
            } else {
                print $line;
            }
        }
    }
}

foreach $file (@ARGV) {
    include_files($file, 0);
}