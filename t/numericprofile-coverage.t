use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 1;

use NUCSurf;
use NUCSurf::NumericProfiler;

use Carp;
#use NUCSurf::NumericProfiler;

no warnings;

#Need to create a mock of the constructor
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

local *NUCSurf::generate_numeric_profile = sub {
    my ($self) = @_;
    my $sequence = "AAAATTTTTATATTTTCGCGCGCGCNCYYYATTTTTTTTTT";
    if ( $self->{_input_format} =~ /^fasta$/o ) {

        my $windowSize = $self->{_window_size};
        my $seq        = NUCSurf::NumericProfiler->new();

        if ( defined ($self->{_2ktuple_rule}) &&
            scalar( @{$self->{_2ktuple_rule}} ) >= 1
        ) {
            print "\$windowSize : $windowSize\n";
            $self = $seq->numeric_profiler_2ktuple($self,$sequence); 
        }

        if (defined ($self->{_3ktuple_rule}) &&
            scalar( @{$self->{_3ktuple_rule}} ) >= 1
        ) {
            $self = $seq->numeric_profiler_3ktuple($self,$sequence);
        }
            
    }
    return $self;
};


use warnings;

my $testObj = NUCSurf->new();
print $testObj->get_window_size();
exit;
my $fileName = $testObj->set_fasta_file_name('test.fa');
$testObj->enable_rule('protein_induced_deformability');
$testObj->generate_numeric_profile();


