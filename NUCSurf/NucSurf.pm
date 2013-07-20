package NucSurf;
use strict;
use warnings;
use Crap;


our $VERSION = 1.0;


sub new  {

	my ($class) = @_;
	my $self    = {
		_content                      => "",
		_input_format                 => "",
		_flag_for_all_property        => "",
		_flag_seqence_based_parameter  => "",
		_flag_ohysio_cemical_parameter   => "",
		_flag_simulation_based_parameter => "",
		_flag_enery_parameter
		
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
1;

__END__
