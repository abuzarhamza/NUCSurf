package NUCSurf;

use 5.014002;
use strict;
use warnings;
use NucSurf::JournalData;

require Exporter;
require 'lib/FASTAParse.pm'

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

our @EXPORT = qw(
	
);

our data_journal;

our $VERSION = 1.0;

#Trule          Arule              Grule      Crule     ATrule

sub new  {

	my ($class) = @_;
	my $self    = {
		_file_content                    => "",
		_input_format                    => "",
		_file_name                       => "",

		_id                              => [],
		_seq                             => [],
		_seq_detail                      => [],

		_flag_for_all_property           => "",
		_flag_seqence_based_parameter    => "",
		_flag_physio_cemical_parameter   => "",
		_flag_simulation_based_parameter => "",
		_flag_enery_parameter            => "",

		_flag_trule                      => "",
		_flag_arule                      => "",
		_flag_grule                      => "",
		_flag_crule                      => "",
		_flag_gcrule                     => "",
		_flag_atrule                     => "",

		_active_prop                     => [],
		_enable_prop2                    => [],
		_enable_prop3                    => [],  

		_window_size                     => 5		
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
	
	foreach (qq/_flag_trule _flag_arule _flag_grule 
		       _flag_crule _flag_gcrule _flag_atrule/
	) {
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


sub CheckPropList {

	my ($self) = @_;

	foreach my $prop (@{ $self->{_active_prop} }) {
				
		if ( $prop =~ /weq/ ) {
			$self->{_flag_split_2} = 'y';			
		}
		elsif ( $prop =~ /weq/ ) {
			$self->{_flag_split_3} = 'y';
		}	

	}

}

=head
=cut

sub SequenceNumericalProfiler {
	my ($self) = @_;

	if ( scalar(@{ $self->{_id} }) > 0 ) {
		

		if ( $self->{_flag_split_2} eq 'y' ) {
			my ($self) = _splitSeqForNumericProf($self,2);
		}

		if ( $self->{_flag_split_3} eq 'y' ) {
			my ($self) = _splitSeqForNumericProf($self,3);
		}
				

		if ( $self->{_flag_split_2} eq 'y' ) {
			my ($self) = _numericProfiler($self,2);
		}

		if ( $self->{_flag_split_3} eq 'y' ) {
			my ($self) = _numericProfiler($self,3);
		}

	}
	
	return $self;
}

=head
=cut
sub _splitSeqForNumericProf {

	my ($self,$split_size) = @_;

	foreach my $i (0 .. $#self->{_id}) {

		my $tempSequence  = $self->{_seq}[$i];
		$tempSequence    .= "_" if((length($tempSequence)%$split_size) != 0);
		
		my $tempStore = "";
		while ( $tempSequence=~/(\w{$split_size})/gi ) {
			$tempStore .= $1.":"; 
		}
		chop $tempStore;

		$self->{_seq_tuple2}[$i] = $tempStore;

	}

	return $self;
}

=head
=cut
sub _numericProfiler {

	my ($self) = @_;

	
	my @enableProp = ( @{$self->{_enable_prop2}} , @{$self->{_enable_prop3}}) ;

	foreach my $i ( 0 .. $#self->{_id} ) {

		my %propArr = () ;
		my $seqId   = $self->{_id}[$i];
		my $tempSeq = $self->{_seq_tuple2}[$i];

		foreach my $tuple ( split(":",$tempSeq) ) {

			foreach my $prop ( @enableProp ) {

				if ( $self->{_window_size} == 1 ) {

					if ( exists $data_journal{$prop}{$tuple} ) {
						$self{$prop}{$seqId} .= $data_journal{$prop}{$tuple} .":";
					}else{
						$self{$prop}{$seqId} .= '0'.":"; 
					}

				} elsif ( $self->{_window_size} > 1 ) {

					if ( exists $data_journal{$prop}{$tuple} ) {
						push @{$propArr{$prop}{_windowarray}},$data_journal{$prop}{$tuple};
					} else {
						push @{$propArr{$prop}{_windowarray}},0;
					}

					if ( scalar( @{$propArr{$prop}{_windowarray}} ) == $self->{_window_size} ) {

						# my $string = join('+',@{$propArr{$prop}{_windowarray}});
						# my $sum    = eval($string);
						my $sum   += $_ for @{$propArr{$prop}{_windowarray}};
						$sum       = $sum/$self->{_window_size};

						$self{$prop}{$seqId} .= $sum.":";			
						shift(@{$propArr{$prop}{_windowarray}});
					}

				}
			}
		}
	}

	return $self;
}

sub ReadFastaSeq {

	my ($self) = @_;
	my $fasta  = FASTAParse->new();
	# $text is the text value fetched from the web tool
	# It should contain the raw sequence
    $fasta->load_FASTA( fasta => $text );
    $self->{_seq}=$fasta->{_sequence};
    $self->{_id}=$fasta->{_id};
    return $self;

}

sub ReadFastaFile {
	my ($self) = @_;
	my $fasta = FASTAParse->new();
    # $fasta->load_FASTA( fasta => $text );
	# 	_file_content                    => "",
	# 	_input_format                    => "",
	# Could not understand how and when these keys would be intialized
	# Assuming that there is ONE file and it contains only one sequence
	# Can handle multiple sequence in a single file
	my $text = "";
	if (defined $self->{_file_name}) {
		open (F, $self->{_file_name} ) or die "Can not open the file $!";
		$text = <F>;
		close F;
		$fasta->load_FASTA( fasta => $text );
	    $self->{_seq}=$fasta->{_sequence};
	    $self->{_id}=$fasta->{_id};
	}
	return $self;
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

Mohd Noor Alam, E<lt>noor@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Mohd Noor Alam

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
