#!/usr/bin/perl -w

use CGI qw/:all/;
# use CGI::Carp qw(fatalsToBrowser warningsToBrowser)

print <<eof;
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Colors!</title>
</head>
<body>
eof

@colours = ("red", "orange", "yellow",
         "green", "blue", "indigo", "violet");

print "<form action='colors_submit_form.cgi' method='POST'>\n";
foreach my $color (@colours) {
    print "<div style='background-color: $color'><input type='radio' name='fav_color' value='$color'>$color</div>\n"
}
print "<input type='submit' />";
print "</form>\n";

print <<eof;
</body>
</html>
eof
    


