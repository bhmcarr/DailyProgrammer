#!/usr/bin/perl

use warnings;
use strict;

my @array = ('0') x 30;

$array[10] = '1';
$array[20] = '1';
$array[3] = '1';
$array[15] = '1';
foreach(@array){print $_;}
print "\n";


for(my $i = 0; $i < 10; $i++){
	pop(@array);
	unshift(@array, '1');
}

foreach(@array){print $_;}
print "\n";
