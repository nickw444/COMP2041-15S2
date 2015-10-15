#!/usr/bin/perl -w

use CGI qw/:all/;
# use CGI::Carp qw(fatalsToBrowser warningsToBrowser)

print <<eof;
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chosen!</title>
</head>
<body>
eof

$color = param('fav_color');
if (defined $color) {
    print "Your favourite colour is $color";
}
else {
    print "You have no favourite colour"
}

print <<eof;
</body>
</html>
eof
    
