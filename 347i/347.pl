#!/usr/bin/perl
use warnings;
use strict;

my $filename = "input.txt";
open(my $fh, "<" ,$filename) or die "Unable to open file: $filename\n";

my $nums;
my @taps;
my $function;
my $initial;
my $nsteps;
while (<$fh>){
	my $line = $_;

	if ($line =~ /\[(\d+,\d+(?:,\d+)*)\] (XOR|XNOR) (\d+) (\d+)/ ){
		$nums 		= $1;
		$function 	= $2;
		$initial 	= $3;
		$nsteps 	= $4;		
	}
	
	

}
close($fh);
