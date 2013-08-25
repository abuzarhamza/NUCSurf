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

	#arule 
	#des - count of nucleotide A
	#max val : none
	#min val : none
	#bio rev : high content has weaker bond

	_arule                      => {
										'aa' => 2,
										'ac' => 1,
										'ag' => 1,
										'at' => 1,
										'ca' => 1,
										'cc' => 0,
										'cg' => 0,
										'ct' => 0,
										'ga' => 1,
										'gc' => 0,
										'gg' => 0,
										'gt' => 0,
										'ta' => 1,
										'tc' => 0,
										'tg' => 0,
										'tt' => 0
									} ,
	#trule 
	#des - count of nucleotide T
	#max val : none
	#min val : none
	#bio rev : high content has weaker bond
	_trule 						=> {
										'aa' => 0,
										'ac' => 0,
										'ag' => 0,
										'at' => 1,
										'ca' => 0,
										'cc' => 0,
										'cg' => 0,
										'ct' => 1,
										'ga' => 0,
										'gc' => 0,
										'gg' => 0,
										'gt' => 1,
										'ta' => 1,
										'tc' => 1,
										'tg' => 1,
										'tt' => 2
									} ,

	#atrule 
	#des - count of nucleotide AT
	#max val : none
	#min val : none
	#bio rev : 
	_atrule                     => {
										'aa' => 2,
										'ac' => 1,
										'ag' => 1,
										'at' => 2,
										'ca' => 1,
										'cc' => 0,
										'cg' => 0,
										'ct' => 1,
										'ga' => 1,
										'gc' => 0,
										'gg' => 0,
										'gt' => 1,
										'ta' => 2,
										'tc' => 1,
										'tg' => 1,
										'tt' => 2
									} ,
	#crule 
	#des - count of nucleotide C
	#max val : none
	#min val : none
	#bio rev :
	_crule                      => 	{	
										'aa' => 0,
										'ac' => 1,
										'ag' => 0,
										'at' => 0,
										'ca' => 1,
										'cc' => 2,
										'cg' => 1,
										'ct' => 1,
										'ga' => 0,
										'gc' => 1,
										'gg' => 0,
										'gt' => 0,
										'ta' => 0,
										'tc' => 1,
										'tg' => 0,
										'tt' => 0
									} ,
	#grule 
	#des - count of nucleotide G
	#max val : none
	#min val : none
	#bio rev :
	_grule 						=> {
										'aa' => 0,
										'ac' => 0,
										'ag' => 1,
										'at' => 0,
										'ca' => 0,
										'cc' => 0,
										'cg' => 1,
										'ct' => 0,
										'ga' => 1,
										'gc' => 1,
										'gg' => 2,
										'gt' => 1,
										'ta' => 0,
										'tc' => 0,
										'tg' => 1,
										'tt' => 0
									} ,
	#gtrule 
	#des - count of nucleotide G
	#max val : none
	#min val : none
	#bio rev :
	_gcrule 					=> {
										'aa' => 0,
										'ac' => 1,
										'ag' => 1,
										'at' => 0,
										'ca' => 1,
										'cc' => 2,
										'cg' => 2,
										'ct' => 1,
										'ga' => 1,
										'gc' => 1,
										'gg' => 2,
										'gt' => 1,
										'ta' => 0,
										'tc' => 1,
										'tg' => 1,
										'tt' => 0
									} ,
	#bendingstiffness 
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_bendingstiffness           => {
										'aa' => 35,
										'ac' => 60,
										'ag' => 60,
										'at' => 20,
										'ca' => 60,
										'cc' => 130,
										'cg' => 85,
										'ct' => 60,
										'ga' => 60,
										'gc' => 85,
										'gg' => 130,
										'gt' => 60,
										'ta' => 20,
										'tc' => 60,
										'tg' => 60,
										'tt' => 35
									} ,
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_dnadenaturation            => {	'aa' => 66.51,
										'ac' => 108.80,
										'ag' => 85.12,
										'at' => 72.29,
										'ca' => 64.92,
										'cc' => 99.31,
										'cg' => 88.84,
										'ct' => 85.12,
										'ga' => 80.03,
										'gc' => 135.83,
										'gg' => 99.31,
										'gt' => 108.80,
										'ta' => 50.11,
										'tc' => 80.03,
										'tg' => 64.92,
										'tt' => 66.51
									} ,

	};


return 1;
