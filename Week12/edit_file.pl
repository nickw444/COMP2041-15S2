#!/usr/bin/perl -w

use CGI qw/:all/;
print header, start_html("A simple example");

if (param('Save') && defined param('contents')) {
    open FILE, ">myfile.txt" or die("Can't open file");
    print FILE param('contents');
    close FILE;
    print h2("Saved!"), end_html;
    exit(0);
}

if (!defined param('contents') && open FILE, "<myfile.txt") {
    my $contents = join "", <FILE>;
    $contents =~ s/&/&amp;/g;
    $contents =~ s/</&lt;/g;
    $contents =~ s/>/&gt;/g;
    param('contents', $contents);
}

print h2('File contents are:'),
        start_form,
        textarea(-name=>'contents', -rows=>10, -cols=>10),
        p, submit('Save'),
        end_form,
        end_html;