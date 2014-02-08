use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 8;

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
ok( $err =~/incorrect argument for the function/, 'set_fasta_file_name() error flag for more than or less than 2 arg');

#test6
my $windowSize = $testObj->set_window_size(10);
ok( $windowSize == 10 , 'set_window_size() set value 10')

#test7
eval {
    $testObj->set_window_size();
};
$err = $@;
ok( $err =~/incorrect argument for the function/, 'set_window_size() error flag for more than or less than 2 arg');

#test8
#eval {
#    $testObj->set_window_size();
#};
#$err = $@;
#ok( $err =~/incorrect argument for the function/, 'set_window_size() error flag for more than or less than 2 arg');
