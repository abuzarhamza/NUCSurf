package NUCSurf;

use 5.006;
use strict;
use warnings;

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
        _file_content                    => "",
        _input_format                    => "",
        _input_filename                  => "",
        _output_filename                 => "",
        _id                              => [],
        _seq                             => [],
        _seq_detail                      => [],
        _enable_rule_list                => [],
        _all_property_rule               => [],
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
sub set_input_file_name {
    croak "incorrect argument for the function"
        if (@_ != 1);

    my ($self,$input_file) = @_;
    if (ref($input_file) ne '' ) {
        croak "provide input is not string type\n";
    }
    $self->{_input_filename} = $input_file;
    return $self->{_input_filename};
}

=head1 set_window_size
Title     : set_window_size
Usage     : $obj->set_window_size(5);
Function  : set the window size for numeric profilling calculation
Returns   : obj
Argument  : window_size
=cut
sub set_window_size {
    croak "incorrect argument for the function"
        if (@_ != 1);

    my ($self,$window_size) = @_;
    if (ref($window_size) ne '' ) {
        croak "provide input is not string type\n";
    }
    if ($window_size !~ /^\d{1,}$/) {
        croak "provide input is not an integer\n";
    }
    $self->{_window_size} = $window_size;
    return $self->{_window_size};
}

=head set_output_file_name
Title     : set_output_file_name
Usage     : $obj->set_output_file_name("tmp.txt");
Function  : set output file name
Returns   : obj
Argument  : output file name
=cut
sub set_output_file_name {
    croak "incorrect argument for the function"
        if (@_ != 1);

    my ($self,$output_file) = @_;
    if (ref($output_file) ne '' ) {
        croak "provide input is not string type\n";
    }
    $self->{_output_filename} = $output_file;
    return $self->{output_filename};
}

=head1 get_available_rules
Title     : get_available_rules
Usage     : $obj->get_available_rules();
Function  : give the list of rule for anlaysis of nucleotide 
Returns   : array
Argument  : output file name
=cut
sub get_available_rules {
    croak "incorrect argument for the function"
        if (@_ != 0);
    my ($self)   = @_;
    my @listProp = NUCSurf::RuleCataloge->available_nuc_rules();
    return @listProp;
}

=head1 print_detail_abt_rules
Title     : print_detail_abt_rules
Usage     : $obj->print_detail_abt_rules('popertyName'=>'details');$obj->print_detail_abt_rules('popertyName'=>'all');
Function  : 
Returns   : 
Argument  : 
=cut
sub print_detail_abt_rules {
    croak "incorrect argument for the function"
        if (@_ != 3);
    my ($self,$prop_name,$key_for_cat) = @_;
    
    my $str = NUCSurf::RuleCataloge->print_detail_abt_rules({
                                                    $prop_name => $key_for_cat 
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
    croak "incorrect argument for the function"
        if (@_ != 1);
    my ($self,$prop_name) = @_;

    if ( scalar( @{ $self->{_all_property_rule} } ) == 0 ) {
        my @propertyList = NUCSurf::RuleCataloge->available_nuc_rules();
        @{ $self->{_all_property_rule} } = @propertyList;
    }


    if ( !( grep { $prop_name eq $element } @{ $self->{_all_property_rule} } )) {
        croak "incorrect argument for the function";
    }
    elsif ( !( grep { $prop_name eq $element } @{ $self->{_enable_rule_list} } ) )  {
        push @{ $self->{_enable_rule_list} }, $prop_name;
        #copy the data of the nuc rule data into self
        $ref_hash = NUCSurf::RuleCataloge->copy_nuc_rules_data($prop_name);
        $self->{$prop_name}{_data} = { $ref_hash->{$prop_name}{data} };
        $self->{$prop_name}{_ktuple} = { $ref_hash->{$prop_name}{ktuple} };
    }
    else {
        warning "$prop_name already enabled\n";
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
    return @{ $self->{_enable_rule_list} };
}

=head1 read_fasta_file
Title     : read_fasta_file
Usage     : $obj->read_fasta_file();
Function  : give the list of enable rules
Returns   : array|null
Argument  : none
=cut
sub read_fasta_file {
    my ($self) = @_;

    if (-e "$self->{_input_filename}" ) {
         croak "file cannot be found $self->{_input_filename}\n";
    }

    local $/ = "\n>";
    open (RF1,"$self->{_input_filename}") or die "cant open the file : $self->{_input_filename}";
    while(<RF1>) { 
        #call Fasta to get the id and other seq.
    }
    close RF1;
}

sub generate_numeric_profile {
    #1. this will call validate object
    #2. parse the content as per the format
    #3. calculate the property rules.
    # if ( ) {
    #     NUCSurf::NumericProfiler-numeric_profiler();
    # }
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
