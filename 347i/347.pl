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

	my @seed = split("", $initial);
	
	my $i = 0;
	my @vals = (0) x scalar @taps;
	foreach(@taps){
		my $tap = $_;
		$vals[$i] += $seed[$tap];
		$i++;
	}
	
	my $size = scalar @vals;
	# get initial cur value
	my $cur = $vals[0] ^ $vals[1];
	if ($size > 2){
		for (my $i=2; $i < $size-1; $i++){
			$cur = $cur ^= $vals[$i];
		}
	}
	print "$cur\n";
}
close($fh);
