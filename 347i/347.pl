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
	
	my $seedsize = scalar @seed;
	print "$line";
	if ($function =~ /XOR/){
		my $xorcount = 1;
		print "0  ";
		foreach (@seed){print $_};
		print "\n";
		while ($xorcount <= $nsteps){
			my $i = 0;
			my @vals = (0) x scalar @taps;

			foreach(@taps){
				my $tap = $_;
				$vals[$i] += $seed[$tap];
				$i++;
			}

			my $size = scalar @vals;

			my $xor = 0;
			foreach(@vals){
				$xor = $xor ^ $_;
			}
				
			pop(@seed);
			unshift (@seed, $xor);

			print "$xorcount ";
			print " " if $xorcount < 10;
			foreach(@seed){print $_};
			print "\n";	
			$xorcount++
		}
	}
	print "\n";
}
close($fh);
