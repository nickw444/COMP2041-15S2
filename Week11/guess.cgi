#!/usr/bin/perl -w

use CGI qw/:all/;
# use CGI::Carp qw(fatalsToBrowser warningsToBrowser)

$max_num_to_guess = 99;
print <<eof;
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guess my number!</title>
</head>
<body>
eof


# warningsToBrowser(1);

$number_to_guess = param('number_to_guess');
$guess = param('guess');

$game_over = 0;

if (defined $number_to_guess and defined $guess) {
    $guess =~ s/\D//g;
    $number_to_guess =~ s/\D//g;

    if ($guess == $number_to_guess) {
        print "You guessed right! It was  $number_to_guess\n";
        $game_over = 1;
    }
    elsif ($guess < $number_to_guess) {
        print "It's higher than $guess. \n";
    }
    else  {
        print "It's lower than $guess. \n";
    }
}
else {
    $number_to_guess = int(rand $max_num_to_guess);
    print "I've thought of a number 0..$max_num_to_guess\n";
}

if ($game_over) {
    print <<eof;
    <form method="POST">
        <input type="submit" value="Play Again" />
    </form>
eof
}
else {
    print <<eof;
    <form method="POST">
        <input type="text" name="guess" />
        <input type="hidden" name="number_to_guess" value="$number_to_guess" />
        <input type="submit" value="Check my Answer" />

    </form>
eof
}

print <<eof;
</body>
</html>
eof
    


