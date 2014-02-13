use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 3;

use NUCSurf;
#TO DO
#NEED TO DEVIDE THE TEST INTO DIFFERENT FILE

my $testObj = NUCSurf->new();
eval {
	$testObj->generate_numeric_profile();
};
my $err = $@;

#test1
ok( $err =~/set the input file name/ , 'generate_numeric_profile() expected error for callling the subroutine without setting  the input file name');

#test2
$testObj->set_fasta_file_name('test.fa');

eval {
	$testObj->generate_numeric_profile();
};
$err = $@;
ok( $err =~/set the output file/ , 'generate_numeric_profile() expected error for callling the subroutine without setting  the output file name');