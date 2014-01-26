use lib '/home/abuzzar/Desktop/project/nucleotide/gitProject/NUCSurf/RuleCatalog';
package NUCSurf;

use 5.014002;
use strict;
use warnings;

require Exporter;
use Carp;
use RuleCatalog;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use NUCSurf ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();
our $VERSION = '0.01';


# Preloaded methods go here.
=head
=cut
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
        _flag_list                       => [],
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
	my ($self) = @_;
	my @listProp = RuleCatalog->available_nuc_rules();
	return @listProp;
}

=head1 print_detail_abt_rules
Title     : print_detail_abt_rules
Usage     : $obj->print_detail_abt_rules('popertyName'=>'description');$obj->print_detail_abt_rules('popertyName'=>'all');
Function  : 
Returns   : 
Argument  : 
=cut
sub print_detail_abt_rules {
	my ($self,$hash_ref) = @_;
	if (ref($hash_ref) ne 'HASH') {
		croak "incorrect data type not HASH type\n";
	}
	my @keys = keys %$hash_ref;
	if (scalar(@keys) > 1) {
		croak "more than one key\n";
	}
	my $str = RuleCatalog->print_detail_abt_rules({
													$keys[0] => $hash_ref->{$keys[0]} 
													});
	return $str;
}

=head1 get_enable_rules
Title     : get_enable_rules
Usage     : $obj->get_enable_rules();
Function  : give the list of enable rules
Returns   : array
Argument  : none
=cut
sub get_enable_rules {
}


=head1 enable_rule
Title     : enable_rule
Usage     : $obj->enable_rule(@array);
Function  : enable the list of rules
Returns   : none
Argument  : array
=cut
sub enable_rule {
    #EnableProperty
    #validate the list passed by user 'simple'
    #enable the list of property passed by the user
    #copy the required keys  
    #eg delete $foo{'foo_rule'}
    #add the keys for the enable rule as 'y' and rest as 'n'
    #enable the flag for required ktuple for the property
    #get the rules detail from hash GetRuleCataloge(propertyName=>'ktuple')
    #throw an error if the rule is not found
    
}

sub ReadFastaSeq {
    #this module will used for web
}

sub ReadFastaFile {
    #read the fasta file
}

sub GetNumericProfile {
    #1. this will call validate object
    #2. parse the content as per the format
    #3. calculate the property rules.
    #print on screen or else on file as per required
}

sub numericProfiler {
    #do the numeric calculation for fasta sequence
    #save the outut     
}



1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

NUCSurf - Perl extension for blah blah blah

=head1 SYNOPSIS

  use NUCSurf;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for NUCSurf, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

abuzar, E<lt>abuzzar@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by abuzar

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
