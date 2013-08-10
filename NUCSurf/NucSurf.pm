package NucSurf;
use strict;
use warnings;
use Crap;


our $VERSION = 1.0;

#Trule          Arule              Grule      Crule     ATrule

sub new  {

	my ($class) = @_;
	my $self    = {
		_file_content                    => "",
		_input_format                    => "",
		_file_name                       => "",
		
		_id                              => [],
		_sequence                        => [],

		_flag_for_all_property           => "",
		_flag_seqence_based_parameter    => "",
		_flag_ohysio_cemical_parameter   => "",
		_flag_simulation_based_parameter => "",
		_flag_enery_parameter            => "",

		_flag_trule                      => "",
		_flag_arule                      => "",
		_flag_grule                      => "",
		_flag_crule                      => "",
		_flag_gcrule                     => "",
		_flag_atrule                     => "",
		
		
	};

	bless $class,$self;

	return $self;
}



=head
=cut
sub SetInputFormat {
	
	my($self,$input_format) = @_;

	if (ref($input_format) ne 'STRING' ) {
		die "provide input is not string\n";
	}

	if ($input_format !~/fasta/) {
		die "could not recognize the provide input format\n";
	}

	$self->{_input_format} = 'fasta';

	return $self->{_input_format};
}

=head
=cut
sub GetInputFormat {
	
	my($self,$input_format) = @_;

	if (! (exists $self->{_input_format})) {
		die "please set the input format\n";
	}

	return $self->{_input_format};
}

=head
EnableSeqBasedProperty : enable the squence based property
@in                    : 
@out                   :
=cut
sub EnableSeqBasedParameter {
	
	my($self) = @_;

	if ( $self->{_flag_seqence_based_parameter} eq '' ) {
		$self->{_flag_seqence_based_parameter} = 'y';
	}

	return $self;
}

=head
=cut
sub ListSeqBasedParameter {
	
	my ($self) = @_;
	
	foreach (qq/_flag_trule _flag_arule _flag_grule _flag_crule _flag_gcrule _flag_atrule/) {
		print "$_\n";
	}
	
}

=head
EnableSimulationBasedProperty : enable simulation based property
@in                           :
@out                          :
=cut
sub EnableSimulationBasedParameter {

	my($self) = @_;

	if ( $self->{_flag_simulation_based_parameter} eq '' ) {
		$self->{_flag_simulation_based_parameter} = 'y';
	}

	foreach (qq/_flag_trule _flag_arule _flag_grule _flag_crule _flag_gcrule _flag_atrule/) {
		$self->{$_} = 'y';
	}
	
	return $self;
}

=head
=cut
sub ListSimulationBasedParameter {

}

=head
=cut
sub EnablePhysioChemicalParameter {
	
}

=head
=cut
sub ListPhysioChemicalParamter {

}

=head
//to do for noor :)
1. create a subroutine to parse the fasta file
2. It would be nice if some existing perl module could be use for parsing
3. the subroutine sould save the object in key so that it could be use in another sunroutine 
for futhur processing
4. for now commiting in master will be better
5. _file_name or from _file_content (for webtool development) 

//to do for noor 
1. subroutine to set the file
2. subroutine to get the file
=cut


1;
__END__
