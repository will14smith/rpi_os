#!/usr/bin/perl
my ($str) = @ARGV;

$str =~ s/\\([rnt'"\\])/"qq|\\$1|"/gee;

my $len = length($str) + 1;

if(($len % 4) != 0) 
{
	$len = ($len & ~3) + 4;
}

my $words = $len / 4;
for($i = 0; $i < $words; $i++)
{
	$char = substr($str, $i << 2, 4);
	if(length($char) < 4)
	{
		$char .= "\0" x (4 - length($char));
	}
	
	print "	.word 0x" . join('', reverse map {unpack('H*', $_)} split //, $char) . "\n";
}
