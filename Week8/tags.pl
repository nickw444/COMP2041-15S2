#!/usr/bin/env perl -w

# ./program -f website.com



$should_sort = 0;

foreach $url (@ARGV) {
    if ($url eq "-f") {
        $should_sort++;
    }
    else {
        $webpage = `wget -q -O- '$url'`;
        $webpage = lc $webpage;
        $webpage =~ s/<!--.*?-->//g; # remove comments 
        @tags = $webpage =~ /<\s*(\w+)/g;
        foreach $tag (@tags) {
            $tag_count{$tag} ++;
        }
    }
}

if ($should_sort){
    @tags = keys %tag_count;
    # ['a' => 10, 'br' => 5,'p' => 20, ..]
    # $tag_count{'a'} = 10
    @sorted_tags = sort {$tag_count{$a} <=> $tag_count{$b}} @tags;
    # ['br', 'a', 'p']
    foreach $tag (@sorted_tags) {
        print "$tag $tag_count{$tag}\n";
    }

}
else {
    foreach $tag (sort keys %tag_count) {
        print "$tag $tag_count{$tag}\n";
    } 
}

