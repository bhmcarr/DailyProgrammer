#!/usr/bin/perl
use warnings;
use strict;

my $filename = "input.txt";
open(my $fh, "<" ,$filename) or die "Unable to open file: $filename\n";

my ($nums, $function, $initial, $nsteps);
my @taps;
while (<$fh>){
	my $line = $_;

	if ($line =~ /\[(\d+,\d+(?:,\d+)*)\] (XOR|XNOR) (\d+) (\d+)/ ){
		($nums, $function, $initial, $nsteps) = ($1, $2, $3, $4);
	}

	@taps = split(",",$nums);
	
}
close($fh);
