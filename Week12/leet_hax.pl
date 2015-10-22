#!/usr/bin/perl
use CGI ':all';
print header, start_html;
$subject = param('MailSubject');
$message = param('MailBody');
print "Hello world";

if (!open(MAIL, "|echo \"$subject\"")) {
    print h1("Sorry, can't send mail.");
}
else {
    $lines = <MAIL>;
    print($lines);
    close(MAIL);
}

print end_html;