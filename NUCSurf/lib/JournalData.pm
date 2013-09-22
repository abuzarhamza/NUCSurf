package JournalData;


use version; 
$VERSION = qv('0.0.3');
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_charmm27_rise 				=> {
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_charmm27_twist 		=> {
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_charmm27_shift 		=> {
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
	#dnadenaturation
	#des - count of nucleotide G
	#max val : 
	#min val : 
	#bio rev :
	_xray_rise 				=> {
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
	_xray_roll 				=> {
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
	_xray_shift 			=> {
								'gg'=> 0.16 ,
								'cg'=> 0.00 ,
								'tt'=> 0.11 ,
								'ct'=> -0.20 ,
								'ag'=> 0.35 ,
								'ga'=> -0.20 ,
								'cc'=> 0.16 ,
								'at'=> 0.00 ,
								'gc'=> 0.00 ,
								'tg'=> 0.35 ,
								'ta'=> 0.00 ,
								'aa'=> 0.11 ,
								'ac'=> 0.35 ,
								'ca'=> 0.01 ,
								'tc'=> 0.35 ,
								'generic'=> 0.00 ,
				 				'gt'=> 0.01
	 						} ,

	_xray_slide 			=> {
								'gg'=> -0.18 ,
								'cg'=> -0.18 ,
								'tt'=> -0.00 ,
								'ct'=> 0.26 ,
								'ag'=> -0.19 ,
								'ga'=> 0.26 ,
								'cc'=> -0.18 ,
								'at'=> 0.30 ,
								'gc'=> -0.18 ,
								'tg'=> -0.16 ,
								'ta'=> 0.30 ,
								'aa'=> -0.00 ,
								'ac'=> -0.16 ,
								'ca'=> -0.07 ,
								'tc'=> -0.19 ,
								'generic'=> -0.04 ,
								'gt'=> -0.07
	 						} ,

	_xray_tilt 				=> {
								'gg'=> -0.38 ,
								'cg'=> 0.00 ,
								'tt'=> -3.28 ,
								'ct'=> -0.80 ,
								'ag'=> -3.02 ,
								'ga'=> -0.80 ,
								'cc'=> -0.38 ,
								'at'=> 0.00 ,
								'gc'=> 0.00 ,
								'tg'=> 0.12 ,
								'ta'=> 0.00 ,
								'aa'=> -3.28 ,
								'ac'=> 0.12 ,
								'ca'=> -0.12 ,
								'tc'=> -3.02 ,
								'generic'=> 0.00 ,
								'gt'=> -0.12
							} ,
	_xray_twist 			=> {
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

	_parm94_rise 		=> {
							'gg'=> 3.57,
							'cg'=> 3.35,
							'tt'=> 3.30,
							'ct'=> 3.34,
							'ag'=> 3.36,
							'ga'=> 3.34,
							'cc'=> 3.57,
							'at'=> 3.28,
							'gc'=> 3.35,
							'tg'=> 3.37,
							'ta'=> 3.28,
							'aa'=> 3.30,
							'ac'=> 3.37,
							'ca'=> 3.28,
							'tc'=> 3.36,
							'generic'=> 3.35,
							'gt'=> 3.28
						} ,
	_parm94_roll		=>	{
							'gg'=> 4.99,
							'cg'=> 0.64,
							'tt'=> 1.62,
							'ct'=> 1.79,
							'ag'=> 2.19,
							'ga'=> 1.79,
							'cc'=> 4.99,
							'at'=> 10.16,
							'gc'=> 0.64,
							'tg'=> 0.16,
							'ta'=> 10.16,
							'aa'=> 1.62,
							'ac'=> 0.16,
							'ca'=> 9.71,
							'tc'=> 2.19,
							'generic'=> 3.69,
							'gt'=> 9.71
						} ,
	_parm94_shift 		=> {
							'gg'=> -0.11,
							'cg'=> 0.00,
							'tt'=> -0.14,
							'ct'=> -0.03,
							'ag'=> -0.02,
							'ga'=> -0.03,
							'cc'=> -0.11,
							'at'=> 0.00,
							'gc'=> 0.00,
							'tg'=> 0.09,
							'ta'=> 0.00,
							'aa'=> -0.14,
							'ac'=> 0.09,
							'ca'=> -0.21,
							'tc'=> -0.02,
							'generic'=> 0.00,
							'gt'=> -0.21
						} ,
	_parm94_slide 		=> {
							'gg'=> -1.58,
							'cg'=> -1.03,
							'tt'=> -0.98,
							'ct'=> -0.88,
							'ag'=> -1.37,
							'ga'=> -0.88,
							'cc'=> -1.58,
							'at'=> -0.94,
							'gc'=> -1.03,
							'tg'=> -1.15,
							'ta'=> -0.94,
							'aa'=> -0.98,
							'ac'=> -1.15,
							'ca'=> -0.70,
							'tc'=> -1.37,
							'generic'=> -1.09,
							'gt'=> -0.70
						} ,	
	_parm94_tilt	 	=> {
							'gg'=> -1.59,
							'cg'=> 0.00,
							'tt'=> -1.40,
							'ct'=> -0.80,
							'ag'=> -1.25,
							'ga'=> -0.80,
							'cc'=> -1.59,
							'at'=> 0.00,
							'gc'=> 0.00,
							'tg'=> -1.15,
							'ta'=> 0.00,
							'aa'=> -1.40,
							'ac'=> -1.15,
							'ca'=> 0.33,
							'tc'=> -1.25,
							'generic'=> 0.00,
							'gt'=> 0.33
						} ,
	_parm94_twist => {
						'gg'=> 29.95,
						'cg'=> 33.57,
						'tt'=> 31.32,
						'ct'=> 33.45,
						'ag'=> 28.80,
						'ga'=> 33.45,
						'cc'=> 29.95,
						'at'=> 29.45,
						'gc'=> 33.57,
						'tg'=> 31.67,
						'ta'=> 29.45,
						'aa'=> 31.32,
						'ac'=> 31.67,
						'ca'=> 28.25,
						'tc'=> 28.80,
						'generic'=> 30.43,
						'gt'=> 28.25
					} ,

	_parm99_rise => {
					'gg'=> 3.59,
					'cg'=> 3.34,
					'tt'=> 3.34,
					'ct'=> 3.35,
					'ag'=> 3.39,
					'ga'=> 3.35,
					'cc'=> 3.59,
					'at'=> 3.27,
					'gc'=> 3.34,
					'tg'=> 3.37,
					'ta'=> 3.27,
					'aa'=> 3.34,
					'ac'=> 3.37,
					'ca'=> 3.23,
					'tc'=> 3.39,
					'generic'=> 3.35,
					'gt'=> 3.23
				} ,
	_parm99_roll => {
						'gg'=> 4.60,
						'cg'=> 0.24,
						'tt'=> 1.73,
						'ct'=> 1.42,
						'ag'=> 2.51,
						'ga'=> 1.42,
						'cc'=> 4.60,
						'at'=> 8.28,
						'gc'=> 0.24,
						'tg'=> -0.33,
						'ta'=> 8.28,
						'aa'=> 1.73,
						'ac'=> -0.33,
						'ca'=> 8.78,
						'tc'=> 2.51,
						'generic'=> 3.37,
						'gt'=> 8.78
					} ,
	_parm99_shift => {
						'gg'=> 0.16,
						'cg'=> 0.00,
						'tt'=> -0.24,
						'ct'=> -0.35,
						'ag'=> -0.09,
						'ga'=> -0.35,
						'cc'=> 0.16,
						'at'=> 0.00,
						'gc'=> 0.00,
						'tg'=> 0.23,
						'ta'=> 0.00,
						'aa'=> -0.24,
						'ac'=> 0.23,
						'ca'=> -0.52,
						'tc'=> -0.09,
						'generic'=> 0.00,
						'gt'=> -0.52
					} ,
	_parm99_slide => {
						'gg'=> -1.04,
						'cg'=> -0.48,
						'tt'=> -0.47,
						'ct'=> -0.30,
						'ag'=> -0.89,
						'ga'=> -0.30,
						'cc'=> -1.04,
						'at'=> -0.34,
						'gc'=> -0.48,
						'tg'=> -0.81,
						'ta'=> -0.34,
						'aa'=> -0.47,
						'ac'=> -0.81,
						'ca'=> -0.31,
						'tc'=> -0.89,
						'generic'=> -0.59,
						'gt'=> -0.31
					} ,
	_parm99_tilt => {
					'gg'=> -0.97,
					'cg'=> 0.00,
					'tt'=> -2.04,
					'ct'=> -1.55,
					'ag'=> -2.10,
					'ga'=> -1.55,
					'cc'=> -0.97,
					'at'=> 0.00,
					'gc'=> 0.00,
					'tg'=> -0.92,
					'ta'=> 0.00,
					'aa'=> -2.04,
					'ac'=> -0.92,
					'ca'=> -0.57,
					'tc'=> -2.10,
					'generic'=> -0.00,
					'gt'=> -0.57
				} ,
	_parm99_twist => {
					'gg'=> 33.49,
					'cg'=> 33.70,
					'tt'=> 33.81,
					'ct'=> 36.34,
					'ag'=> 30.83,
					'ga'=> 36.34,
					'cc'=> 33.49,
					'at'=> 32.04,
					'gc'=> 33.70,
					'tg'=> 33.01,
					'ta'=> 32.04,
					'aa'=> 33.81,
					'ac'=> 33.01,
					'ca'=> 27.52,
					'tc'=> 30.83,
					'generic'=> 32.21,
					'gt'=> 27.52
				} ,



	 _b_a_trimeric => {
						'aaa' => 1.17,
						'aac' => 1.22,
						'aag' => 1.57,
						'aat' => 1.39,
						'atc' => 1.11,
						'aca' => 0.52,
						'acg' => 0.57,
						'aga' => 0.95,
						'agc' => 0.48,
						'agg' => 0.64,
						'ata' => 0.63,
						'caa' => 0.52,
						'cac' => 0.67,
						'cag' => 0.46,
						'cca' => 0.44,
						'ccg' => 0.42,
						'cga' => 0.56,
						'cgc' => 0.64,
						'cta' => 0.66,
						'gaa' => 0.72,
						'gac' => 0.49,
						'gca' => 0.76,
						'gcc' => 0.54,
						'gga' => 0.56,
						'gta' => 0.67,
						'tca' => 0.58,
						'acc' => 0.3,
						'act' => 0.3,
						'atg' => 0.22,
						'ccc' => 0.26,
						'ctc' => 0.21,
						'ttt' => 1.17,
						'gtt' => 1.22,
						'ctt' => 1.57,
						'att' => 1.39,
						'gat' => 1.11,
						'tgt' => 0.52,
						'cgt' => 0.57,
						'tct' => 0.95,
						'gct' => 0.48,
						'cct' => 0.64,
						'tat' => 0.63,
						'ttg' => 0.52,
						'gtg' => 0.67,
						'ctg'=> 0.46,
						'tgg' => 0.44,
						'cgg' => 0.42,
						'tcg' => 0.56,
						'gcg' => 0.64,
						'tag' => 0.66,
						'ttc' => 0.72,
						'gtc' => 0.49,
						'tgc' => 0.76,
						'ggc' => 0.54,
						'tcc' => 0.56,
						'tac' => 0.67,
						'tga' => 0.58,
						'ggt' => 0.3,
						'agt' => 0.3,
						'cat' => 0.22,
						'ggg' => 0.26,
						'gag' => 0.21,
						'taa' => 0.50,
						'tta' => 0.50
						} ,
	_bend_scl 		=> {
						'aaa' => -0.274,
						'aac' => -0.205,
						'aag' => -0.081,
						'aat' => -0.28,
						'aca' => -0.006,
						'acc' => -0.032,
						'acg' => -0.033,
						'act' => -0.183,
						'aga' => 0.027,
						'agc' => 0.017,
						'agg' => -0.057,
						'agt' => -0.183,
						'ata' => 0.182,
						'atc' => -0.110,
						'atg' => 0.134,
						'att' => -0.280,
						'caa' => 0.015,
						'cac' => 0.040,
						'cag' => 0.175,
						'cat' => 0.134,
						'cca' => -0.246,
						'ccc' => -0.012,
						'ccg' => -0.136,
						'cct' => -0.057,
						'cga' => -0.003,
						'cgc' => -0.077,
						'cgg' => -0.136,
						'cgt' => -0.033,
						'cta' => 0.090,
						'ctc' => 0.031,
						'ctg' => 0.175,
						'ctt' => -0.081,
						'gaa' => -0.037,
						'gac' => -0.013,
						'gag' => 0.031,
						'gat' => -0.110,
						'gca' => 0.076,
						'gcc' => 0.107,
						'gcg' => -0.077,
						'gct' => 0.017,
						'gga' => 0.013,
						'ggc' => 0.107,
						'ggg' => -0.012,
						'ggt' => -0.032,
						'gta' => 0.025,
						'gtc' => -0.013,
						'gtg' => 0.040,
						'gtt' => -0.205,
						'taa' => 0.068,
						'tac' => 0.025,
						'tag' => 0.090,
						'tat' => 0.182,
						'tca' => 0.194,
						'tcc' => 0.013,
						'tcg' => -0.003,
						'tct' => 0.027,
						'tga' => 0.194,
						'tgc' => 0.076,
						'tgg' => -0.246,
						'tgt' => -0.006,
						'tta' => 0.068,
						'ttc' => -0.037,
						'ttg' => 0.015,
						'ttt' => -0.274
						} ,
	_np_scl 		=> {
						'aaa' => -36,
						'aac' => -6,
						'aag' => 6,
						'aat' => -30,
						'aca' => 6,
						'acc' => 8,
						'acg' => 8,
						'act' => 11,
						'aga' => -9,
						'agc' => 25,
						'agg' => 8,
						'agt' => 11,
						'ata' => -13,
						'atc' => 7,
						'atg' => 18,
						'att' => -30,
						'caa' => -9,
						'cac' => 17,
						'cag' => -2,
						'cat' => 18,
						'cca' => 8,
						'ccc' => 13,
						'ccg' => 2,
						'cct' => 8,
						'cga' => 31,
						'cgc' => 25,
						'cgg' => 2,
						'cgt' => 8,
						'cta' => -18,
						'ctc' => 8,
						'ctg' => -2,
						'ctt' => 6,
						'gaa' => -12,
						'gac' => 8,
						'gag' => 8,
						'gat' => 7,
						'gca' => 13,
						'gcc' => 45,
						'gcg' => 25,
						'gct' => 25,
						'gga' => -5,
						'ggc' => 45,
						'ggg' => 13,
						'ggt' => 8,
						'gta' => -6,
						'gtc' => 8,
						'gtg' => 17,
						'gtt' => -6,
						'taa' => -20,
						'tac' => -6,
						'tag' => -18,
						'tat' => -13,
						'tca' => 8,
						'tcc' => -5,
						'tcg' => 31,
						'tct' => -9,
						'tga' => 8,
						'tgc' => 13,
						'tgg' => 8,
						'tgt' => 6,
						'tta' => -20,
						'ttc' => -12,
						'ttg' => -9,
						'ttt' => -36
					}
	};


return 1;
