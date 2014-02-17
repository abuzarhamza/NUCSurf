use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 1;

use NUCSurf;
use NUCSurf::NumericProfiler;
use Data::Dumper;

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

        push @{ $self->{_id} },'idTest1';
            $self->{$id}{_descrption} = join("|",'description');

            if (defined ($self->{_2ktuple_rule}) &&
                scalar( @{$self->{_2ktuple_rule}} ) >= 1
            ) {
               my $refHash = $seq->numeric_profiler_2ktuple($self,$sequence);
               %dataCal = %$refHash;
            }

            if (defined ($self->{_3ktuple_rule}) &&
                scalar( @{$self->{_3ktuple_rule}} ) >= 1
            ) {
                my $refHash = $seq->numeric_profiler_3ktuple($self,$sequence);
                %dataCal = %$refHash;
            }

            foreach my $propertyName (keys %dataCal) {
                if (exists $dataCal{$propertyName} ) {
                    $self->{$id}{$propertyName}{_nuc_prof} =  $dataCal{$propertyName};
                }
            }
            print Dumper (\%dataCal);
            
    }
    return $self;
};


use warnings;

my $testObj = NUCSurf->new();
print $testObj->get_window_size();
my $fileName = $testObj->set_fasta_file_name('test.fa');
$testObj->enable_rule('protein_induced_deformability');
$testObj->generate_numeric_profile();

print ">>>>", $testObj->print_numeric_profile();
