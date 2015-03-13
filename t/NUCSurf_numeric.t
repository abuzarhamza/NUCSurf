use FindBin;
use lib "$FindBin::Bin/../..";

use Test::Simple tests => 3;

use NUCSurf;
use Carp;

#Need to stub and mock subroutine
#to make them compatable for unit testing
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

#test3
$testObj->set_output_file_name('testOutput.fa');
eval {
	$testObj->generate_numeric_profile();
};
$err = $@;
ok( $err =~/no NUCSurf property is enabled/ , 'generate_numeric_profile() expected error for callling the subroutine without setting NUCSurf property');