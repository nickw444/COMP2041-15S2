#!/usr/bin/perl -w

$dataset_dir = $ARGV[0] or die;

$unsw_latitude =  -33.9172238;
$unsw_longitude = 151.2302268;

sub distance_from_unsw($$);

foreach $user_directory (glob "$dataset_dir/users/*") {
    # body...
    open F, "<$user_directory/details.txt" or next;
    my ($line, $latitude, $longitude, $username, $suburb);
    while ($line = <F>) {
        if ($line =~ /^home_longitude: (\S+)/) {
            $longitude = $1;
        }
        elsif ($line =~ /^home_latitude: (\S+)/) {
            $latitude = $1;
        }
        elsif ($line =~ /^home_suburb: (\S+)/) {
            $suburb = $1;
        }
        elsif ($line =~ /^username: (\S+)/) {
            $username = $1;
        }        
    }
    if (defined $longitude && defined $latitude ) {
        my $distance = distance_from_unsw($longitude, $latitude);    
        if (defined $suburb) {
            $suburb = "($suburb)";
        }
        else {
            $suburb = "";
        }
        $user_string = "$username lives at $latitude, $longitude $suburb";
        $user_distances{$user_string} = $distance;
    }
}
@sorted_users = sort {$user_distances{$a} <=> $user_distances{$b}} (keys %user_distances);
foreach my $k (@sorted_users) {
    print $k, "\n";
}

sub distance_from_unsw($$) {
    my ($longitude, $latitude) = @_;
    return sqrt(($latitude - $unsw_latitude) ** 2 + ($longitude - $unsw_longitude) ** 2);
}