package JournalData;


use version; $VERSION = qv('0.0.3');
use warnings;
use strict;
use Carp;




require Exporter;
require 'lib/FASTAParse.pm'

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(%data_journal);


our %data_journal = {
	#rule
	#description
	#max value
	#min value
	#pmid




};


return 1;
