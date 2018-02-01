#!/usr/bin/perl
use warnings;
use strict;

my @day = (0) x 24;
my $filename = "input.txt";
open(my $fh, "<", $filename) or die "Could not open $filename\n";

while (<$fh>){
	my @line = split(' ', $_);
	for (my $i = $line[0]; $i < $line[1]; $i++){$day[$i-1] = 1;}
}
close($fh);

my $count = 0;
foreach (@day){
	$count++ if $_ == 1;
}

print "$count\n";
