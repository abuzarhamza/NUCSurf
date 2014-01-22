package NUCSurf;

use 5.014002;
use strict;
use warnings;

require Exporter;
use NUCSurf::RuleCatalog;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use NUCSurf ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.01';


# Preloaded methods go here.
=head
=cut
sub new {
    #SetObject
    #to decide list of object keys
    my ($class) = shift;
    my $self    = {
		_file_content                    => "",
		_input_format                    => "",
		_input_filename                  => "",
        _output_filename                 => "",

		_id                              => [],
		_seq                             => [],
		_seq_detail                      => [],

        _flag_list                       => ['_flag_t_rule', '_flag_a_rule', '_flag_g_rule','_flag_c_rule','_flag_at_rule',                                     '_flag_gc_rule',
                                             '_flag_bendingstiffness_rule','_flag_dna_denaturation','_flag_duplexstability_free_energy','_flag_propellar_twist','_flag_protein_induced_deform','_flag_stabilising_energy_zdna','_stacking_energy'
                                            ]
		
		_window_size                     => 5		
	};

    bless $self,$class;
	return $self;
}

=head set_input_file_name
Title     : set_input_file_name
Usage     : $obj->set_input_file_name("tmp.fa")
Function  : set the input file path
Returns   : obj
Argument  : input_file
=cut
sub set_input_file_name {
    my ($self,$input_file) = shift;
    if (ref($input_file) ne '' ) {
		die "provide input is not string type\n";
	}
	$self->{_input_filename} = $input_file;
	return $self->{_input_filename};
}

=head set_window_size
Title     : set_window_size
Usage     : $obj->set_window_size(5);
Function  : set the window size for numeric profilling calculation
Returns   : obj
Argument  : window_size
=cut
sub set_window_size {
    my ($self,$window_size) = shift;
    if (ref($window_size) ne '' ) {
		die "provide input is not string type\n";
	}
    if ($window_size !~ /^\d{1,}$/) {
		die "provide input is not an integer\n";
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
    my ($self,$output_file) = shift;
    if (ref($output_file) ne '' ) {
		die "provide input is not string type\n";
	}
	$self->{_output_filename} = $output_file;
	return $self->{output_filename};
}

=head2 get_rule_list
Title     : get_rule_list
Usage     : $obj->set_output_file_name('name');
Function  : get the list of supported rules/properties
Returns   : @(array)
Argument  : none
=cut
sub get_rule_list {
	my($self) = @_;
    #GetSupportedRules
    #get list of rules that will be supported
    #GetRuleCataloge(propertyName=>'simple')
    
}

=head2 print_detail_abt_rules
Title     : get_detail_abt_rules
Usage     : $obj->get_detail_abt_rules('trule'=>'description')  ,=>min_value,=>max_value,=>data,=>reference,=>complete_detail
Function  : get description or other value for the specified property
Returns   : none
Argument  : 
=cut
sub print_detail_abt_rules {
    #List out property detail information and journal from where it has been taken
    #get the rules detail from hash GetRuleCataloge(propertyName=>'details')
}

sub EnableRule {
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

sub GetEnableRules {
    #GetEnableProperty
    #return array with list of property
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

sub ReadFastaSeq {
    #this module will used for web
}

sub ReadFastaFile {
    #read the fasta file
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
