#!/usr/bin/perl -w 
use CGI qw/:all/;

sub browse_screen {
    my $n = param('n') || 0;
    my @users = ('me','lol');
    $n = min(max($n, 0), $#users);
    param('n', $n + 1);
    my $user_to_show  = $users[$n];
    # my $details_filename = "$user_to_show/details.txt";
    # open my $p, "$details_filename" or die "can not open $details_filename: $!";

    $details = "YOLO";
    close $p;

    return p,
        start_form, "\n",
        pre($details),"\n",
        hidden('n', $n + 1),"\n",
        submit('Next user'),"\n",
        end_form, "\n",
        p, "\n";
}

print header,
      start_html('Hello World'),
      browse_screen,
      end_html,
