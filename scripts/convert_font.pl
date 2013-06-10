#!/usr/bin/perl
my ($src) = @ARGV;

open my $fh, '<', $src or die($!);
binmode($fh);

my $char;
while(my $len = read($fh, $char, 4))
{
	print "	.word 0x" . join('', reverse map {unpack('H*', $_)} split //, $char) . "\n";
}
close $fh;
