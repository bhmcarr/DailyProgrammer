#!/usr/bin/perl
use warnings;
use strict;

use Switch;

# argument handling (this is kind of horrible)
my $filename = "$ARGV[0]" or die "USAGE: \n  347i.pl [INPUT FILE]\n";
open(my $fh, "<" ,$filename) or die "Unable to open file: $filename\n";

my ($nums, $function, $initial, $nsteps);
my @taps;
while (<$fh>){
	my $line = $_;

	# yank out everything we need from a line and store it nicely
	if ($line =~ /\[(\d+,\d+(?:,\d+)*)\] (XOR|XNOR) (\d+) (\d+)/ ){
		($nums, $function, $initial, $nsteps) = ($1, $2, $3, $4);
	}

	@taps = split(",",$nums);

	my @seed = split("", $initial);
	
	my $seedsize = scalar @seed;
	print "$line";

	my $iterations = 1;
	print "0  ";
	foreach (@seed){print $_};
	print "\n";
	while ($iterations <= $nsteps){
		my $i = 0;
		my @vals = (0) x scalar @taps;

		foreach(@taps){
			my $tap = $_;
			$vals[$i] += $seed[$tap];
			$i++;
		}

		my $size = scalar @vals;

		my $xor = $vals[0];
		for(my $i = 1; $i < $size; $i++){
			if ($function =~ /XOR/){
				$xor = $xor ^ $vals[$i];
			}
			elsif ($function =~ /XNOR/){
				if ($xor == $vals[$i]){
					$xor = 1;
				}
				else{
					$xor = 0;
				}
			}
			else {die "Invalid function.\n";}
		}
			
		pop(@seed);
		unshift (@seed, $xor);

		print "$iterations ";
		print " " if $iterations < 10;
		foreach(@seed){print $_};
		print "\n";	
		$iterations++
	}
	print "\n";
}
close($fh);
