use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 1;

use NUCSurf;
#TO DO
#NEED TO DEVIDE THE TEST INTO DIFFERENT FILE

my $testObj = NUCSurf->new();
eval {
	$testObj->generate_numeric_profile();
};
my $err = $@;
ok( $err =~/set the input file name/ , 'generate_numeric_profile() expected error for callling the function without setting  the input file name');

$testObj->set_fasta_file_name('test.fa');
$testObj->generate_numeric_profile();