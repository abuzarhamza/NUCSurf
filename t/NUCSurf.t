use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 5;

use NUCSurf;  

my $testObj = NUCSurf->new();

#test1
ok( defined($testObj) && ref $testObj  eq 'NUCSurf',     'NUCSurf->new() works' );

#test2
my $fileName = $testObj->set_fasta_file_name('test.fa');
ok( $fileName eq 'test.fa', 'set_fasta_file_name() get');

#test3
my @tmp = ();
eval {
    $testObj->set_fasta_file_name(\@tmp);
};
my $err = $@;
ok( $err =~/provide input is not string type/, 'set_fasta_file_name() error flag for array ref');

#test4
my %tmp = ();
eval {
    $testObj->set_fasta_file_name(\%tmp);
};
$err = $@;
ok( $err =~/provide input is not string type/, 'set_fasta_file_name() error flag for hash ref');

#test5
eval {
    $testObj->set_fasta_file_name('test.fa','test.fa');
};
$err = $@;
ok( $err =~/incorrect argument for the function/, 'set_fasta_file_name() error flag for more than 2 arg');

#test6
