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
	_dnadenaturation            => {	
									'aa' => 66.51,
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

	duplexstability_freeenergy  => {
									'aa' => -1.2,
	 								'ac' => -1.5,
	 								'ag' => -1.5,
	 								'at' => -0.9,
	 								'ca' => -1.7,
	 								'cc' => -2.3,
	 								'cg' => -2.8,
	 								'ct' => -1.5,
	 								'ga' => -1.5,
	 								'gc' => -2.3,
	 								'gg' => -2.3,
	 								'gt' => -1.5,
	 								'ta' => -0.9,
	 								'tc' => -1.5,
	 								'tg' => -1.7,
	 								'tt' => -1.2
	 								} ,

	_propellartwist 			=> {
									'aa' => -18.66, 
									'ac' => -13.10, 
									'ag' => -14.00, 
									'at' => -15.01, 
									'ca' => -9.45, 
									'cc' => -8.11, 
									'cg' => -10.03, 
									'ct' => -14.00, 
									'ga' => -13.48, 
									'gc' => -11.08, 
									'gg' => -8.11, 
									'gt' => -13.10, 
									'ta' => -11.85, 
									'tc' => -13.48, 
									'tg' => -9.45, 
									'tt' => -18.66
									} ,

	_proteininduceddeform 		=> {
									'aa' => 2.9, 
									'ac' => 2.3, 
									'ag' => 2.1, 
									'at' => 1.6, 
									'ca' => 9.8, 
									'cc' => 6.1, 
									'cg' => 12.1, 
									'ct' => 2.1, 
									'ga' => 4.5, 
									'gc' => 4.0, 
									'gg' => 6.1, 
									'gt' => 2.3, 
									'ta' => 6.3, 
									'tc' => 4.5, 
									'tg' => 9.8, 
									'tt' => 2.9
									} ,

	_stabilisingenergy_zdna 	=> {	
									'aa' => 3.9, 
									'ac' => 4.6, 
									'ag' => 3.4, 
									'at' => 5.9, 
									'ca' => 1.3, 
									'cc' => 2.4, 
									'cg' => 0.7, 
									'ct' => 3.4, 
									'ga' => 3.4, 
									'gc' => 4.0, 
									'gg' => 2.4, 
									'gt' => 4.6, 
									'ta' => 2.5, 
									'tc' => 3.4, 
									'tg' => 1.3, 
									'tt' => 3.9
									} ,

	_stackingenergy 			=> {
									'aa' => -5.37, 
									'ac' => -10.51, 
									'ag' => -6.78, 
									'at' => -6.57, 
									'ca' => -6.57, 
									'cc' => -8.26, 
									'cg' => -9.69, 
									'ct' => -6.78, 
									'ga' => -9.81, 
									'gc' => -14.59, 
									'gg' => -8.26, 
									'gt' => -10.51, 
									'ta' => -3.82, 
									'tc'=> -9.81, 
									'tg' => -6.57, 
									'tt' => -5.37
									} ,
		_charmm27_rise 			=> {
									'gg'=> 3.55,
									'cg'=> 3.27,
									'tt'=> 3.37,
									'ct'=> 3.35,
									'ag'=> 3.31,
									'ga'=> 3.35,
									'cc'=> 3.55,
									'at'=> 3.39,
									'gc'=> 3.27,
									'tg'=> 3.20,
									'ta'=> 3.39,
									'aa'=> 3.37,
									'ac'=> 3.20,
									'ca'=> 3.46,
									'tc'=> 3.31,
									'generic'=> 3.36,
									'gt'=> 3.46
								} ,
	_charmm27_roll 				=> {	
									'gg'=> 5.34 ,
									'cg'=> 3.19 ,
									'tt'=> 5.89 ,
									'ct'=> 3.78 ,
									'ag'=> 6.45 ,
									'ga'=> 3.78 ,
									'cc'=> 5.34 ,
									'at'=> 5.57 ,
									'gc'=> 3.19 ,
									'tg'=> 3.44 ,
									'ta'=> 5.57 ,
									'aa'=> 5.89 ,
									'ac'=> 3.44 ,
									'ca'=> 9.64 ,
									'tc'=> 6.45 ,
									'generic'=> 5.74 ,
									'gt'=> 9.64
								} ,
	_charmm27_slide 		=> {
								'gg'=> -0.18,
			 					'cg'=> -0.18,
			 					'tt'=> -0.00,
			 					'ct'=> 0.26,
			 					'ag'=> -0.19,
			 					'ga'=> 0.26,
			 					'cc'=> -0.18,
			 					'at'=> 0.30,
			 					'gc'=> -0.18,
			 					'tg'=> -0.16,
			 					'ta'=> 0.30,
			 					'aa'=> -0.00,
			 					'ac'=> -0.16,
			 					'ca'=> -0.07,
			 					'tc'=> -0.19,
			 					'generic'=> -0.04,
			 					'gt'=> -0.07
	 						},
	_charmm27_tilt 		=> {
								'gg'=> -0.38 ,
								'cg'=> 0.00,
								'tt'=> -3.28,
								'ct'=> -0.80,
								'ag'=> -3.02,
								'ga'=> -0.80,
								'cc'=> -0.38,
								'at'=> 0.00,
								'gc'=> 0.00,
								'tg'=> 0.12,
								'ta'=> 0.00,
								'aa'=> -3.28,
								'ac'=> 0.12,
								'ca'=> -0.12,
								'tc'=> -3.02,
								'generic'=> 0.00,
								'gt'=> -0.12
						 	} ,
	_charmm27_twist 	=> {
								'gg'=> 35.50 ,
								'cg'=> 35.58 ,
								'tt'=> 35.62 ,
								'ct'=> 38.65 ,
								'ag'=> 31.45 ,
								'ga'=> 38.65 ,
								'cc'=> 35.50 ,
								'at'=> 36.63 ,
								'gc'=> 35.58 ,
								'tg'=> 31.96 ,
								'ta'=> 36.63 ,
								'aa'=> 35.62 ,
								'ac'=> 31.96 ,
								'ca'=> 33.43 ,
								'tc'=> 31.45 ,
								'generic'=> 34.22 ,
								'gt'=> 33.43
						} ,
	_charmm27_shift 	=> {
								'gg' => 0.01,
								'cg'=>0.00,
								'tt'=>-0.30,
								'ct'=>-0.28,
								'ag'=>0.00,
								'ga'=>-0.28,
								'cc'=>0.01,
								'at'=>0.00,
								'gc'=>0.00,
								'tg'=>0.37,
								'ta'=>0.00,
								'aa'=>-0.30,
								'ac'=>0.37,
								'ca'=>-0.23,
								'tc'=>0.00,
								'generic'=>0.00,
								'gt'=>-0.23
						},
	_xray_rise 		=> {
								'gg'=> 3.29 ,
								'cg'=> 3.46 ,
								'tt'=> 3.25 ,
								'ct'=> 3.50 ,
								'ag'=> 3.23 ,
								'ga'=> 3.50 ,
								'cc'=> 3.29 ,
								'at'=> 3.34 ,
								'gc'=> 3.46 ,
								'tg'=> 3.20 ,
								'ta'=> 3.34 ,
								'aa'=> 3.25 ,
								'ac'=> 3.20 ,
								'ca'=> 3.14 ,
								'tc'=> 3.23 ,
								'generic'=> 3.29 ,
								'gt'=> 3.14
					} ,

	_xray_roll 	=> {
								'gg'=> 5.34 ,
								'cg'=> 3.19 ,
								'tt'=> 5.89 ,
								'ct'=> 3.78 ,
								'ag'=> 6.45 ,
								'ga'=> 3.78 ,
								'cc'=> 5.34 ,
								'at'=> 5.57 ,
								'gc'=> 3.19 ,
								'tg'=> 3.44 ,
								'ta'=> 5.57 ,
								'aa'=> 5.89 ,
								'ac'=> 3.44 ,
								'ca'=> 9.64 ,
								'tc'=> 6.45 ,
								'generic'=> 5.74 ,
								'gt'=> 9.64
					} ,

	};


return 1;
