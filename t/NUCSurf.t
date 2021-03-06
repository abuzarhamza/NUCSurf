use FindBin;
use lib "$FindBin::Bin/../..";

use Test::Simple tests => 22;

use NUCSurf;
use Carp;

no warnings;

local *NUCSurf::set_fasta_file_name = sub {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);

    my ($self,$input_file) = @_;
    if (ref($input_file) ne '' ) {
        croak "provide parameter is not string\n";
    }
    $self->{_input_filename} = $input_file;
    $self->{_input_format}   = 'fasta';
    return $self->{_input_filename};
};


local *NUCSurf::set_output_file_name = sub {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);

    my ($self,$output_file) = @_;

    if (ref($output_file) ne '' ) {
        croak "provide parameter is not string\n";
    }

    $self->{_output_filename} = $output_file;
    return $self->{output_filename};

};

use warnings;

my $testObj = NUCSurf->new();
#$testObj->generate_numeric_profile();

#test1
ok( defined($testObj) && ref $testObj  eq 'NUCSurf',     'NUCSurf->new() works' );

my $windowSize = $testObj->get_window_size();
ok ($windowSize == 5, 'get the default value of the window size') ;
#test6
$windowSize = $testObj->set_window_size(10);
ok( $windowSize == 10 , 'set_window_size() set value for the window');


#test7
eval {
    $testObj->set_window_size();
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'set_window_size() expected  error for passed parameter count');

#test8
eval {
    $windowSize = $testObj->set_window_size(\@tmp);
};
$err = $@;
ok( $err =~/provide parameter is not string/, 'set_window_size() expected error for incorrect passed parameter');

#test9
eval {
    $windowSize = $testObj->set_window_size(\%tmp);
};
$err = $@;
ok( $err =~/provide parameter is not string/, 'set_window_size() expected error flag for incorrect passed parameter');

#test10
eval {
    $testObj->set_window_size('test');
};
$err = $@;
ok( $err =~/provide parameter is not an integer/, 'set_window_size() expected error flag for incorrect passed parameter');

#test11
@tmp = $testObj->get_available_rules();
ok(scalar(@tmp) == 28, 'get_available_rules() got the property list');

#test12
eval {
    $testObj->get_available_rules('fun');
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'get_available_rules() expected error for passed parameter');

#test13
eval {
    $testObj->print_detail_abt_rules(\@tmp);
};
$err = $@;
ok( $err =~/parameter is not a HASH/, 'get_available_rules() expected error for passed parameter');

#test14
eval {
    $testObj->print_detail_abt_rules('foo');
};
$err = $@;
ok( $err =~/parameter is not a HASH/, 'get_available_rules() expected error for passed parameter');

#test15
eval {
    $testObj->print_detail_abt_rules();
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'get_available_rules() expected error for incorrect count of parameter passed');

#test16
eval {
    $testObj->print_detail_abt_rules();
};
$err = $@;
ok( $err =~/incorrect count of parameter for the function/, 'get_available_rules() expected error for incorrect count of parameter passed');

#test17
$tmp = $testObj->print_detail_abt_rules({protein_induced_deformability => 'simple'});
ok( $tmp =~/protein_induced_deformability/, 'print_detail_abt_rules() got the posted responce');

#test18
$tmp = $testObj->print_detail_abt_rules({protein_induced_deformability => 'data'});
ok( $tmp =~/gg : 6.1/, 'print_detail_abt_rules() got the posted responce');

#test19
$tmp = $testObj->print_detail_abt_rules({protein_induced_deformability => 'all'});
ok( $tmp =~/gg : 6.1/, 'print_detail_abt_rules() got the posted responce');

#test20
eval {
	$tmp = $testObj->print_detail_abt_rules({test => 'all'});
};
$err = $@;
ok($err =~/property test does not match the avaible rules\/properties/ ,'print_detail_abt_rules() expected error for incorrect property name parameter');

#test21
eval {
	$tmp = $testObj->print_detail_abt_rules({protein_induced_deformability => 'hash'});
};
$err = $@;
ok($err =~/no such hash key present for the protein_induced_deformability/ ,'print_detail_abt_rules() expected error for incorrect data parameter');

my $fileName = $testObj->set_fasta_file_name('test.fa');
#test22
$tmp = $testObj->enable_rule('protein_induced_deformability');
ok( scalar(@{$testObj->{_2ktuple_rule}}) != 0,'enable_rule() set the rule');

#test23
ok($testObj->{protein_induced_deformability}{_ktuple} == 2 , 'enable_rule() expected ktuple value i.e 2');

#test24
ok($testObj->{protein_induced_deformability}{_data}{aa} == 2.9, 'enable_rule() expected tuple value tuple aa');

#test25
@tmp = $testObj->get_enable_rules();
ok( scalar(@tmp) == 1, 'get_enable_rules()');