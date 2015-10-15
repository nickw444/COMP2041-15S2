print "<!-- ";
foreach $param (param()) {
    my $value = param($param);
    $value =~ s/\</&lt;/g;
    print "$param='$value'";
}
print "-->\n"

