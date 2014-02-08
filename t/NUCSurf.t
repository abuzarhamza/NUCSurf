use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 13;

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
ok( $err =~/provide parameter is not string/, 'set_fasta_file_name() expected error for passed array ref parameter');

#test4
my %tmp = ();
eval {
    $testObj->set_fasta_file_name(\%tmp);
};
$err = $@;
ok( $err =~/provide parameter is not string/, 'set_fasta_file_name() expected error flag for passed hash ref parameter');

#test5
eval {
    $testObj->set_fasta_file_name('test.fa','test.fa');
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'set_fasta_file_name() expected error for passed argument count');

#test6
my $windowSize = $testObj->set_window_size(10);
ok( $windowSize == 10 , 'set_window_size() set value for the window');


#test7
eval {
    $testObj->set_window_size();
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'set_window_size() expected  error for passed argument count');

#test8
eval {
    $windowSize = $testObj->set_window_size(\@tmp);
};
$err = $@;
ok( $err =~/provide argument is not string/, 'set_window_size() expected error for passed parameter type');

#test9
eval {
    $windowSize = $testObj->set_window_size(\%tmp);
};
$err = $@;
ok( $err =~/provide input is not string type/, 'set_window_size() error flag for hash as arg');

#test10
eval {
    $testObj->set_window_size('test');
};
$err = $@;
ok( $err =~/provide input is not an integer/, 'set_window_size() error flag for string as arg');

#test11
@temp = $testObj->get_available_rules();
ok(scalar(@temp) == 28, 'get_available_rules() got the property list');

#test12
eval {
    $testObj->get_available_rules('fun');
};
$err = $@;
ok( $err =~/incorrect argument for the function/, 'get_available_rules() got the expected error');

#test13
eval {
    $testObj->print_detail_abt_rules($tmp);
};
$err = $@;
ok( $err =~/parameter is not a valid HASH/, 'get_available_rules() got the expected error');

