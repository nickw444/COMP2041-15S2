#!/usr/bin/env perl -w

print "username: ";
$username = <STDIN>;
chomp $username;
print "password: ";
$password = <STDIN>;
chomp $password;

$password_file = "users/$username.password";
if (!open F, "<$password_file") {
    print "Uknown username!\n";
}
else {
    $correct_password = <F>;
    chomp $correct_password;
    if ($password eq $correct_password) {
        print "You are authenticated!.\n";
    }
    else {
        print "Incorrect password!\n";
    }

}
