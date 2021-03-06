#!/usr/bin/perl
# Bartosz [ponury] Ponurkiewicz

use strict;

$#ARGV >= 0 or die "$0 <regex#1> [regex#2] ...";

my @pattern = @ARGV or die $!;
my $line;

while ($line = <STDIN>) {
	my $i = 1;

	foreach (@pattern) {
		my $c = "\033\[01;3" . $i++ . "m";
		if ($i % 8 == 0) {
			$i = 1;
		}

		$line =~ s/($_)/$c\1\033\[0;0m/gi;
	}

	print $line;
}
