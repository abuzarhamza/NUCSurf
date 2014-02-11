package NUCSurf;

use 5.006;
use strict;
use warnings;
use diagnostics;

require Exporter;
use Carp;
use FASTAParse;
use NUCSurf::RuleCataloge;

=head1 NAME

NUCSurf - The great new NUCSurf!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

the module for analysis of various biochemical/structural property of DNA

Perhaps a little code snippet.

    use NUCSurf;

    my $foo = NUCSurf->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();


sub new {
    my ($class) = shift;
    my $self    = {};
    bless $self,$class;
    $self->_initialize();
    return $self;
}

=head _initialize
Title     : _initialize
Usage     : 
Function  : intialize the new object.
Returns   : 
Argument  : 
=cut
sub _initialize {
    my ($self) = @_;
    $self->{
        _input_format                    => "",
        _input_filename                  => "",
        _output_filename                 => "",
        _id                              => [],
        _numeris_seq                     => [],
        _seq_detail                      => [],
        _enable_rule_list                => [],
        _all_property_rule               => [],
        _2ktuple_rule                    => [],
        _3ktuple_rule                    => [],  
        _window_size                     => 5
    };
}

=head1 set_input_file_name
Title     : set_input_file_name
Usage     : $obj->set_input_file_name("tmp.fa")
Function  : set the input file path
Returns   : obj
Argument  : input_file
=cut
sub set_fasta_file_name {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);

    my ($self,$input_file) = @_;
    if (ref($input_file) ne '' ) {
        croak "provide parameter is not string\n";
    }
    $self->{_input_filename} = $input_file;
    $self->{_input_format}   = 'fasta';
    return $self->{_input_filename};
}

=head1 get_input_file_name
Title     : get_input_file_name
Usage     : $obj->get_input_file_name()
Function  : return the file name
Returns   : obj
Argument  : none
=cut
sub get_input_file_name {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 1);

    if (not defined $_[0]->{_input_filename}) {
        croak "input file not set";
    }
    return $_[0]->{_input_filename};
}

=head1 set_window_size
Title     : set_window_size
Usage     : $obj->set_window_size(5);
Function  : set the window size for numeric profilling calculation
Returns   : obj
Argument  : window_size
=cut
sub set_window_size {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);

    my ($self,$window_size) = @_;

    if (ref($window_size) ne '' ) {
        croak "provide parameter is not string\n";
    }
    if ($window_size !~ /^\d{1,}$/) {
        croak "provide parameter is not an integer\n";
    }

    $self->{_window_size} = $window_size;
    return $self->{_window_size};
}

=head1 get_window_size
Title     : get_window_size
Usage     : $obj->get_window_size(5);
Function  : return the window size
Returns   : obj
Argument  : none
=cut
sub get_window_size {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 1);
    return $_[0]->{_window_size};
}

=head set_output_file_name
Title     : set_output_file_name
Usage     : $obj->set_output_file_name("tmp.txt");
Function  : set output file name
Returns   : obj
Argument  : output file name
=cut
sub set_output_file_name {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);

    my ($self,$output_file) = @_;

    if (ref($output_file) ne '' ) {
        croak "provide parameter is not string\n";
    }

    $self->{_output_filename} = $output_file;
    return $self->{output_filename};
}

=head get_output_file_name
Title     : get_output_file_name
Usage     : $obj->get_output_file_name();
Function  : get output file name
Returns   : str
Argument  : nones
=cut
sub get_output_file_name {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 1);

    if (not defined $_[0]->{_output_filename}) {
        croak "output file is not set";
    }
    return $_[0]->{output_filename};
}

=head1 get_available_rules
Title     : get_available_rules
Usage     : $obj->get_available_rules();
Function  : give the list of rule for anlaysis of nucleotide 
Returns   : array
Argument  : output file name
=cut
sub get_available_rules {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 1);
    my ($self)   = @_;
    my @listProp = NUCSurf::RuleCataloge->available_nuc_rules();
    return @listProp;
}

=head1 print_detail_abt_rules
Title     : print_detail_abt_rules
Usage     : $obj->print_detail_abt_rules('popertyName'=>'details');$obj->print_detail_abt_rules('popertyName'=>'all');
Function  : print detail about the rules
Returns   : string with all required detail
Argument  : hash
=cut
sub print_detail_abt_rules {
    croak "incorrect count of parameter for the function"
        if (scalar(@_) != 2);
    my ($self,$param) = @_;
  
    if (ref($param) ne 'HASH' ) {
        croak "parameter is not a HASH\n";
    }
    my ($propName)  = keys %$param;
    my $key_for_cat = $param->{$propName};

    my $objRule = NUCSurf::RuleCataloge->new();
    my $str     = $objRule->print_detail_abt_rules({
                                                    $propName => $key_for_cat 
                                                    });
    return $str;
}

=head1 enable_rule
Title     : enable_rule
Usage     : $obj->enable_rule(@array);
Function  : enable the list of rules
Returns   : none
Argument  : array
=cut
sub enable_rule {
    croak "incorrect count of parameter for the function"
        if (@_ != 2);
    my ($self,$prop_name) = @_;
    my $pushFlag          = 1;
    
    if (  not defined @{ $self->{_all_property_rule} } ) {
        my @propertyList = NUCSurf::RuleCataloge->available_nuc_rules();
        @{ $self->{_all_property_rule} } = @propertyList;
    }
    
    if ( !( grep { $_ eq $prop_name } @{ $self->{_all_property_rule} } )) {
        croak "incorrect property passed as parameter\n";
    }

    #test to check if user has already enable the property
    if (not defined @{ $self->{_enable_rule_list} } ) {
        push @{ $self->{_enable_rule_list} }, $prop_name;
    }
    elsif ( ( grep { $_ eq $prop_name } @{ $self->{_enable_rule_list} } ) )  {
        warn "$prop_name already enabled\n";
        $pushFlag = 0;
    }
    else{
        push @{ $self->{_enable_rule_list} }, $prop_name;
    }

    if ($pushFlag) {
        my $ref_hash = NUCSurf::RuleCataloge->copy_nuc_rules_data($prop_name);
        $self->{$prop_name}{_ktuple} = $ref_hash->{$prop_name}{ktuple} ;

        foreach my $tuple ( keys %{ $ref_hash->{$prop_name}{data} } ) {
            $self->{$prop_name}{_data}{$tuple} =  $ref_hash->{$prop_name}{data}{$tuple};
        }

        if ( $self->{$prop_name}{_ktuple} == 2 ) {
            push @{ $self->{_2ktuple_rule} },$prop_name;
        }
        elsif ( $self->{$prop_name}{_ktuple} == 3 )  {
            push @{ $self->{_3ktuple_rule} },$prop_name;
        }
    }

    return $self;
}


=head1 get_enable_rules
Title     : get_enable_rules
Usage     : $obj->get_enable_rules();
Function  : give the list of enable rules
Returns   : array|null
Argument  : none
=cut
sub get_enable_rules {
    my ($self) = @_;
    if (not defined @{ $self->{_enable_rule_list} } ) {
        return qw//;
    }
    return @{ $self->{_enable_rule_list} };
}


=head1 generate_numeric_profile
Title     : generate_numeric_profile
Usage     : $obj->generate_numeric_profile();
Function  : parse the file and generate the numeric profile of the provided sequence
Returns   : $self
Argument  : none
=cut
sub generate_numeric_profile {
    my ($self) = @_;

    #TO DO CHECK THE FILE
    #TO DO CHECK THE OUTPUT FILE
    #NEED TO TEST WITH CLOSURE
    my $callbackCheck1 = sub {$self->get_input_file_name()};
    #my $callbackCheck2 = $self->get_output_file_name() ;
    print "\$callbackCheck1 : $callbackCheck1\n";


    if ( $self->{_input_format} =~ /^fasta$/o ) {
        local $/ = "\n>";
        open (RF1,"$self->{_input_filename}") or die "cant open the file : $self->{_input_filename}";
        while(<RF1>) {
            #call Fasta to get the id and other seq.
            my $fasta = FASTAParse->new();
            $fasta->load_FASTA( fasta => $_ );
            my $id          = $fasta->id();
            my $sequence    = $fasta->sequence();
            my @descriptors = @{ $fasta->descriptors() };

            #destroy the object
            undef $fasta;
            my $windowSize = $self->{_window_size};
            my $seq        = NUCSurf::NumericProfiler->new();
            my $nucSeq     = $seq->numeric_profiler(\$sequence,$self);
        }
        close RF1;
    }

}

=head1 AUTHOR

abuzar hamza, C<< <abuzarhamza at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-nucsurf at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NucSURF>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc NucSURF


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=NucSURF>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/NucSURF>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/NucSURF>

=item * Search CPAN

L<http://search.cpan.org/dist/NucSURF/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 abuzar hamza.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of NUCSurf
