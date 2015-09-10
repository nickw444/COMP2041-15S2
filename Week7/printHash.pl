#!/usr/bin/perl -w

sub printHash {
    my (%hash) = @_;
    my $n = 0;
    foreach my $k (sort keys %hash) {
        print "[$k] => $hash{$k}\n";
        $n++;
    }
    return $n;
}

%lelele = ("John"=>"blue", "Anne"=>"red", "Andrew"=>"green");
$nItems = printHash(%lelele);
print "N-Items: $nItems\n";