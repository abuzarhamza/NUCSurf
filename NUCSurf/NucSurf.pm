package NucSurf;
use strict;
use warnings;
use Crap;


our $VERSIO = 1.0;

# // 
# // Dear maintainer:
# // 
# // Once you are done trying to 'optimize' this routine,
# // and have realized what a terrible mistake that was,
# // please increment the following counter as a warning
# // to the next guy:
# // 
# // total_hours_wasted_here = 42
# // 


sub new  {

	my ($class) = @_;
	my $self    = {
		_content                      => "",
		_input_format                 => "",
		_flag_for_all_property        => "",
		_flag_seqence_based_property  => "",
		_flag_bio_physical_property   => "",
		
	};

	bless $class,$self;

	return $self;
}




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


sub GetInputFormat {
	my($self,$input_format) = @_;

	if (! (exists $self->{_input_format})) {
		die "please set the input format\n";
	}

	return $self->{_input_format};
}

sub EnableSeqBasedProperty {

}


sub ListSeqBasedProperty {

}

sub EnableSimulationBasedProperty {

}

sub ListSimulationBasedProperty {

}


