package NUCSurf::RuleCataloge;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Carp;
#use Smart::Comment;

=head1 NAME

NUCSurf::RuleCataloge - The great new NUCSurf::RuleCataloge!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw(get_rule_cataloge);

=head1 SYNOPSIS

the module list out the various biochemiacl/structural property of DNA molecule.
Simple Usage.

    use NUCSurf::RuleCataloge;
    my $foo = NUCSurf::RuleCataloge->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS
=cut
sub new {
    my ($class) = shift;
    my $self    = {};
    bless $self,$class;
	return $self;
}

=head1 get_rule_cataloge
 Title     : get_rule_cataloge
 Usage     : 
 Function  : 
 Returns   : 
 Argument  : 
=cut
sub _get_rule_cataloge {
	my ($hash_ref) = @_;
	
	my %ruleCataloge = (
		't_rule' => {
							'simple'    => 't_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide t (thymine) in the DNA strand.',
							'data'      =>  {'aa' => 0, 'ac' => 0, 'ag' => 0, 'at' => 1, 'ca' => 0, 'cc' => 0, 'cg' => 0, 'ct' => 1, 'ga' => 0, 'gc' => 0, 'gg' => 0, 'gt' => 1, 'ta' => 1, 'tc' => 1, 'tg' => 1, 'tt' => 2} ,
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },
			  
		'a_rule' => {
							'simple'    => 'a_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide a (adenine) in the DNA strand.',
							'data'      => {'aa' => 2, 'ac' => 1, 'ag' => 1, 'at' => 1, 'ca' => 1, 'cc' => 0, 'cg' => 0, 'ct' => 0, 'ga' => 1, 'gc' => 0, 'gg' => 0, 'gt' => 0, 'ta' => 1, 'tc' => 0, 'tg' => 0, 'tt' => 0},
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },
		'c_rule' => {
							'simple'    => 'c_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide c (cytosine) in the DNA strand.',
							'data'      => {'aa' => 0, 'ac' => 1, 'ag' => 0, 'at' => 0, 'ca' => 1, 'cc' => 2, 'cg' => 1, 'ct' => 1, 'ga' => 0, 'gc' => 1, 'gg' => 0, 'gt' => 0, 'ta' => 0, 'tc' => 1, 'tg' => 0, 'tt' => 0},
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },		
		'g_rule' => {
							'simple'    => 'g_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide g (guanine) in the DNA strand.',
							'data'      => {'aa' => 0, 'ac' => 0, 'ag' => 1, 'at' => 0, 'ca' => 0, 'cc' => 0, 'cg' => 1, 'ct' => 0, 'ga' => 1, 'gc' => 1, 'gg' => 2, 'gt' => 1, 'ta' => 0, 'tc' => 0, 'tg' => 1, 'tt' => 0},
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },		  
		'at_rule' => {
							'simple'    => 'at_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide a (adenine) and t (thymine) or t or a in the DNA strand.',
							'data'      => {'aa' => 2, 'ac' => 1, 'ag' => 1, 'at' => 2, 'ca' => 1, 'cc' => 0, 'cg' => 0, 'ct' => 1, 'ga' => 1, 'gc' => 0, 'gg' => 0, 'gt' => 1, 'ta' => 2, 'tc' => 1, 'tg' => 1, 'tt' => 2},
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },
			  
		'gc_rule' => {
							'simple'    => 'gc_rule',
							'ktuple'    => 2,
							'details'   => 'count of nucleotide g (gunine) and c (cytosine) or g or c in the DNA strand.',
							'data'      => {'aa' => 0, 'ac' => 0, 'ag' => 1, 'at' => 0, 'ca' => 1, 'cc' => 2, 'cg' => 2, 'ct' => 1, 'ga' => 1, 'gc' => 2, 'gg' => 2, 'gt' => 1, 'ta' => 2, 'tc' => 1, 'tg' => 1, 'tt' => 0},
							'min_value' => '0',
							'max_value' => '2',
							'refrence'  => 'NA',
			  },
			  
		'dna_bendingstiffness' => {
							'simple'    => 'dna_bending_stiffness',
							'ktuple'    => 2,
							'details'   => 'The bending stiffness is regarded as the translational positioning of nucleosomes and more precisely the string correlation with the anisotropic flexibility of the DNA. In the analysis, a simple algorithm is used that accounts for nucleosome translational positions in terms of bending free energy. The values are given in nm, which stand for the persistence length value that is derived from experimental data. High peak values correspond to DNA regions that are more rigid, while low peak values correspond to regions that will bend more easily.',
							'data'      => {'aa' => 35, 'ac' => 60,' ag' => 60, 'at' => 20, 'ca' => 60, 'cc' => 130, 'cg' => 85, 'ct' => 60, 'ga' => 60, 'gc' => 85, 'gg' => 130, 'gt' => 60, 'ta' => 20, 'tc' => 60, 'tg' => 60, 'tt' => 35},
							'min_value' => '20 nm',
							'max_value' => '130 nm',
							'refrence'  => 'PMID:7723041',
			},
			
			'dna_denaturation' => {
							'simple'    => 'dna_denaturation',
							'ktuple'    => 2,
							'details'   => 'The denaturation equilibrium is calculated by UV electronic spectroscopy at 270 nm of high-resolution melting experiments on 42 plasmids, containing synthetic repeated inserts. DNA regions with a low peak value are more likely to denaturate than regions with a higher peak value',
							'data'      => {'aa' => 66.51, 'ac' => 108.80, 'ag' => 85.12, 'at' => 72.29, 'ca' => 64.92, 'cc' => 99.31, 'cg' => 88.84, 'ct' => 85.12, 'ga' => 80.03, 'gc' => 135.83, 'gg' => 99.31, 'gt' => 108.80, 'ta' => 50.11, 'tc' => 80.03, 'tg' => 64.92, 'tt' => 66.51},
							'min_value' => '64.35 cal/mol',
							'max_value' => '135.38 cal/mol',
							'refrence'  => 'PMID:9649614,PMID:10366657',
							
			},
			'duplex_free_energy' => {
							'simple'    => 'duplex_free_energy',
							'alias'     => 'duplexstability_freeenergy',#need to be removed
							'ktuple'    => 2,
							'details'   => 'For 50 DNA/DNA duplexes the thermodynamic parameters of the DNA free
							energy were calculated. The melting behavior of these duplexes was observed
							and the transition enthalpy was calculated giving dinucleotide values.
							Regions with a low free energy content will be more stable than regions with
							high thermodynamic energy content',
							'data'      => {'aa' => -1.2, 'ac' => -1.5, 'ag' => -1.5, 'at' => -0.9, 'ca' => -1.7, 'cc' => -2.3, 'cg' => -2.8, 'ct' => -1.5, 'ga' => -1.5, 'gc' => -2.3, 'gg' => -2.3, 'gt' => -1.5, 'ta' => -0.9, 'tc' => -1.5, 'tg' => -1.7, 'tt' => -1.2},
							'min_value' => '-2.1 kcal/mol',
							'max_value' => '-0.9 kcal/mol',
							'refrence'  => 'PMID:8948641',
			},
			'propellar_twist' => {
							'simple'    => 'propellar_twist',
							'ktuple'    => 2,
							'details'   => 'The dinucleotide propeller twist angle scale is measured in degrees and is based on X-ray crystallography of DNA oligomers. A region with high propeller twist would mean that the helix is quite rigid in this area. Correspondingly, regions that are quite flexible would have low propeller twist values',
							'data'      => {'aa' => -18.66, 'ac' => -13.10, 'ag' => -14.00, 'at' => -15.01, 'ca' => -9.45, 'cc' => -8.11, 'cg' => -10.03, 'ct' => -14.00, 'ga' => -13.48, 'gc' => -11.08, 'gg' => -8.11, 'gt' => -13.10, 'ta' => -11.85, 'tc' => -13.48, 'tg' => -9.45, 'tt' => -18.66},
							'min_value' => '-18.66 degree',
							'max_value' => '-8.11 degree',
							'refrence'  => 'PMID:11473010',
			},
			'protein_induced_deformability'=> {
							'simple'    => 'protein_induced_deformability',
							'ktuple'    => 2,
							'details'   => 'The dinucleotide protein deformability scale is derived from empirical energy
							functions extracted from the fluctuations and correlations of structural
							parameters as determined by the examination of more than a hundred crystal
							structures of DNA–protein complexes. On this scale, a larger value reflects a
							more deformable sequence while a smaller value indicates a region where the
							DNA helix is less likely to be changed dramatically by proteins',
							'data'      => {'aa' => 2.9, 'ac' => 2.3, 'ag' => 2.1, 'at' => 1.6, 'ca' => 9.8, 'cc' => 6.1, 'cg' => 12.1, 'ct' => 2.1, 'ga' => 4.5, 'gc' => 4.0, 'gg' => 6.1, 'gt' => 2.3, 'ta' => 6.3, 'tc' => 4.5, 'tg' => 9.8, 'tt' => 2.9},
							'min_value' => '1.6',
							'max_value' => '12.1',
							'refrence'  => 'PMID:9736707',
			},
			'stabilizingenergy_zdna'=> {
							'simple'    => 'stabilizing_energy_of_Z_DNA',
							'ktuple'    => 2,
							'details'   => 'To search for particular DNA segments, which can adopt a left-handedZ-conformation, empirically determined energetic parameters are used.The dinucleotide parameters represent the free energy values for a transition from B- to Z-DNA. Stretches of DNA with low energy minima are more likely to form Z-DNA than a high-energy region',
							'data'      => {'aa' => 3.9, 'ac' => 4.6, 'ag' => 3.4, 'at' => 5.9, 'ca' => 1.3, 'cc' => 2.4, 'cg' => 0.7, 'ct' => 3.4, 'ga' => 3.4, 'gc' => 4.0, 'gg' => 2.4, 'gt' => 4.6, 'ta' => 2.5, 'tc' => 3.4, 'tg' => 1.3, 'tt' => 3.9},
							'min_value' => '5.9 kcal/mol',
							'max_value' => '0.7 kcal/mol',
							'refrence'  => 'PMID:2224047',
			},
			'stacking_energy' => {
							'simple'    => 'stacking_energy',
							'ktuple'    => 2,
							'details'   => 'Dinucleotide base-stacking energy scale expressed in kilocalories per mol, derived from approximate quantum mechanical calculations on crystal structures. High peaks in base stacking reflect regions of the helix that de-stack or melt more easily; conversely a minimal peak would represent more stable regions',
							'data'      => {'aa' => -5.37, 'ac' => -10.51, 'ag' => -6.78, 'at' => -6.57, 'ca' => -6.57, 'cc' => -8.26, 'cg' => -9.69, 'ct' => -6.78, 'ga' => -9.81, 'gc' => -14.59, 'gg' => -8.26, 'gt' => -10.51, 'ta' => -3.82, 'tc'=> -9.81, 'tg' => -6.57, 'tt' => -5.37},
							'min_value' => '-14.59 kcal',
							'max_value' => '-3.82 kcal',
							'refrence'  => 'journal: 10.1002/bip.1978.360171005',
			},
			'nucleosome_position_preference' => {
							'simple'    => 'nucleosome_position_preference',
							'ktuple'    => 3,
							'alias'     => 'np_scl',#to be removed
							'details'   => 'NPP is a trinucleotide model based on the preferential location of sequences within a nucleosomal core. The study was performed on sequences wrapped around nucleosome cores and in closed circles of DNA. They calculated the fractional preference of each base pair triplet for a position facing out. High value peaks represent more rigid regions where nucleosomes are less likely to appear',
							'data'      => {'aaa' => -36, 'aac' => -6, 'aag' => 6, 'aat' => -30, 'aca' => 6, 'acc' => 8, 'acg' => 8, 'act' => 11, 'aga' => -9, 'agc' => 25, 'agg' => 8, 'agt' => 11, 'ata' => -13, 'atc' => 7, 'atg' => 18, 'att' => -30, 'caa' => -9, 'cac' => 17, 'cag' => -2, 'cat' => 18, 'cca' => 8, 'ccc' => 13, 'ccg' => 2, 'cct' => 8, 'cga' => 31, 'cgc' => 25, 'cgg' => 2, 'cgt' => 8, 'cta' => -18, 'ctc' => 8, 'ctg' => -2, 'ctt' => 6, 'gaa' => -12, 'gac' => 8, 'gag' => 8, 'gat' => 7, 'gca' => 13, 'gcc' => 45, 'gcg' => 25, 'gct' => 25, 'gga' => -5, 'ggc' => 45, 'ggg' => 13, 'ggt' => 8, 'gta' => -6, 'gtc' => 8, 'gtg' => 17, 'gtt' => -6, 'taa' => -20, 'tac' => -6, 'tag' => -18, 'tat' => -13, 'tca' => 8, 'tcc' => -5, 'tcg' => 31, 'tct' => -9, 'tga' => 8, 'tgc' => 13, 'tgg' => 8, 'tgt' => 6, 'tta' => -20, 'ttc' => -12, 'ttg' => -9, 'ttt' => -36},
							'min_value' => '-36%',
							'max_value' => '+45%',
							'refrence'  => 'PMID:3806678',
			},
			'bendability' => {
							'simple'    => 'bendability',
							'alias'     => 'bend_scl', #to be removed
							'ktuple'    => 3,
							'details'   => 'The trinucleotide bendability model is based on Dnase I cutting frequencies. The enzyme Dnase I preferably binds to the minor groove and cuts DNA that is bent, or bendable toward the major groove. Thus Dnase I cutting frequencies on naked DNA can be interpreted as a quantitative measure of major groove compressibility or bendability. DNA regions with a high peak correspond to regions that are more flexible than regions with a low peak value.',
							'data'      => {'aaa' => -0.274, 'aac' => -0.205, 'aag' => -0.081, 'aat' => -0.28, 'aca' => -0.006, 'acc' => -0.032, 'acg' => -0.033, 'act' => -0.183, 'aga' => 0.027, 'agc' => 0.017, 'agg' => -0.057, 'agt' => -0.183, 'ata' => 0.182, 'atc' => -0.110, 'atg' => 0.134, 'att' => -0.280, 'caa' => 0.015, 'cac' => 0.040, 'cag' => 0.175, 'cat' => 0.134, 'cca' => -0.246, 'ccc' => -0.012, 'ccg' => -0.136, 'cct' => -0.057, 'cga' => -0.003, 'cgc' => -0.077, 'cgg' => -0.136, 'cgt' => -0.033, 'cta' => 0.090, 'ctc' => 0.031, 'ctg' => 0.175, 'ctt' => -0.081, 'gaa' => -0.037, 'gac' => -0.013, 'gag' => 0.031, 'gat' => -0.110, 'gca' => 0.076, 'gcc' => 0.107, 'gcg' => -0.077, 'gct' => 0.017, 'gga' => 0.013, 'ggc' => 0.107, 'ggg' => -0.012, 'ggt' => -0.032, 'gta' => 0.025, 'gtc' => -0.013, 'gtg' => 0.040, 'gtt' => -0.205, 'taa' => 0.068, 'tac' => 0.025, 'tag' => 0.090, 'tat' => 0.182, 'tca' => 0.194, 'tcc' => 0.013, 'tcg' => -0.003, 'tct' => 0.027, 'tga' => 0.194, 'tgc' => 0.076, 'tgg' => -0.246, 'tgt' => -0.006, 'tta' => 0.068, 'ttc' => -0.037, 'ttg' => 0.015, 'ttt' => -0.274},
							'min_value' => '-0.280',
							'max_value' => '0.194',
							'refrence'  => 'PMID:8579790',
			},
			'a_philicity' => {
							'simple'    => 'a_philicity',
							'alias'     => 'b_a_trimeric', #to be removed
							'ktuple'    => 3,
							'details'   => 'The free energy dinucleotide base pair scale, for the ethanol-induced B to A-DNA conformational transitions in solution, was determined for a series of carefully designed synthetic duplexes. A region in the DNA with a high A-philicity value is more easily converted to the A-form than a low value region, which is more resistant to transition.',
							'data'      => {'aaa' => 1.17, 'aac' => 1.22, 'aag' => 1.57, 'aat' => 1.39, 'atc' => 1.11, 'aca' => 0.52, 'acg' => 0.57, 'aga' => 0.95, 'agc' => 0.48, 'agg' => 0.64, 'ata' => 0.63, 'caa' => 0.52, 'cac' => 0.67, 'cag' => 0.46, 'cca' => 0.44, 'ccg' => 0.42, 'cga' => 0.56, 'cgc' => 0.64, 'cta' => 0.66, 'gaa' => 0.72, 'gac' => 0.49, 'gca' => 0.76, 'gcc' => 0.54, 'gga' => 0.56, 'gta' => 0.67, 'tca' => 0.58, 'acc' => 0.3, 'act' => 0.3, 'atg' => 0.22, 'ccc' => 0.26, 'ctc' => 0.21, 'ttt' => 1.17, 'gtt' => 1.22, 'ctt' => 1.57, 'att' => 1.39, 'gat' => 1.11, 'tgt' => 0.52, 'cgt' => 0.57, 'tct' => 0.95, 'gct' => 0.48, 'cct' => 0.64, 'tat' => 0.63, 'ttg' => 0.52, 'gtg' => 0.67, 'ctg'=> 0.46, 'tgg' => 0.44, 'cgg' => 0.42, 'tcg' => 0.56, 'gcg' => 0.64, 'tag' => 0.66, 'ttc' => 0.72, 'gtc' => 0.49, 'tgc' => 0.76, 'ggc' => 0.54, 'tcc' => 0.56, 'tac' => 0.67, 'tga' => 0.58, 'ggt' => 0.3, 'agt' => 0.3, 'cat' => 0.22, 'ggg' => 0.26, 'gag' => 0.21, 'taa' => 0.50, 'tta' => 0.50},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:7885327',
			},
			'twist_parmbsc0' => {
							'simple'    => 'twist_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'rotation around the rise axis (z axis) of B DNA. ( rotational deformability ). Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'aa' => 0.028 , 'tt' => 0.028 ,  'ac' => 0.036 , 'tg' => 0.036 ,  'ag' => 0.028 , 'tc' => 0.028 ,  'at' => 0.031 , 'ta' => 0.031 ,  'ca' => 0.015 , 'gt' => 0.015 ,  'cc' => 0.026 , 'gg' => 0.026 ,  'cg' => 0.014 , 'gc' => 0.014 ,  'ga' => 0.024 , 'ct' => 0.024 ,  'gc' => 0.022 , 'cg' => 0.022 ,  'ta' => 0.018 , 'at' => 0.018},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'tilt_parmbsc0' => {
							'simple'    => 'tilt_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'rotation around the shift axis (x axis) of B DNA ( rotational deformability).Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'aa' => 0.037 , 'tt' => 0.037 ,  'ac' => 0.038 , 'tg' => 0.038 ,  'ag' => 0.037 , 'tc' => 0.037 ,  'at' => 0.035 , 'ta' => 0.035 ,  'ca' => 0.025 , 'gt' => 0.025 ,  'cc' => 0.042 , 'gg' => 0.042 ,  'cg' => 0.026 , 'gc' => 0.026 ,  'ga' => 0.038 , 'ct' => 0.038 ,  'gc' => 0.036 , 'cg' => 0.036 ,  'ta' => 0.019 , 'at' => 0.019},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'roll_parmbsc0' => {
							'simple'    => 'roll_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'rotation around the slide axis (y axis) of B DNA  (rotational deformability ). Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'aa' => 0.02 , 'tt' => 0.02 ,  'ac' => 0.023 , 'tg' => 0.023 ,  'ag' => 0.019 , 'tc' => 0.019 ,  'at' => 0.022 , 'ta' => 0.022 ,  'ca' => 0.016 , 'gt' => 0.016 ,  'cc' => 0.02 , 'gg' => 0.02 ,  'cg' => 0.016 , 'gc' => 0.016 ,  'ga' => 0.02 , 'ct' => 0.02 ,  'gc' => 0.026 , 'cg' => 0.026 ,  'ta' => 0.015 , 'at' => 0.015},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'shift_parmbsc0' => {
							'simple'    => 'shift_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'displacement along an axis (x axis) in the base-pair plane perpendicular to the first, directed from the minor to the major groove, of B DNA (translational deformability).Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => { 'aa' => 1.72 , 'tt' => 1.72 ,  'ac' => 1.28 , 'tg' => 1.28 ,  'ag' => 1.4 , 'tc' => 1.4 ,  'at' => 1.05 , 'ta' => 1.05 ,  'ca' => 1.05 , 'gt' => 1.05 ,  'cc' => 1.43 , 'gg' => 1.43 ,  'cg' => 1.05 , 'gc' => 1.05 ,  'ga' => 1.32 , 'ct' => 1.32 ,  'gc' => 1.18 , 'cg' => 1.18 ,  'ta' => 0.64 , 'at' => 0.64},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'slide_parmbsc0' => {
							'simple'    => 'slide_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'displacement along an axis ( y axi) in the plane of the base pair directed from one strand to the other,of B DNA (translational deformability).Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'aa' => 2.13 , 'tt' => 2.13 ,  'ac' => 2.98 , 'tg' => 2.98 ,  'ag' => 1.78 , 'tc' => 1.78 ,  'at' => 3.77 , 'ta' => 3.77 ,  'ca' => 1.8 , 'gt' => 1.8 ,  'cc' => 1.57 , 'gg' => 1.57 ,  'cg' => 1.91 , 'gc' => 1.91 ,  'ga' => 1.88 , 'ct' => 1.88 ,  'gc' => 2.59 , 'cg' => 2.59 ,  'ta' => 1.25 , 'at' => 1.25},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'rise_parmbsc0' => {
							'simple'    => 'rise_parmbsc0',
							'ktuple'    => 2,
							'details'   => 'displacement along the helix axis (z axis),of B DNA (translational deformability).Derived from atomistic MD simulations (amber force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'aa' => 7.64 , 'tt' => 7.64 ,  'ac' => 8.83 , 'tg' => 8.83 ,  'ag' => 7.04 , 'tc' => 7.04 ,  'at' => 9.34 , 'ta' => 9.34 ,  'ca' => 6.3 , 'gt' => 6.3 ,  'cc' => 7.86 , 'gg' => 7.86 ,  'cg' => 6.11 , 'gc' => 6.11 ,  'ga' => 8.48 , 'ct' => 8.48 ,  'gc' => 9.47 , 'cg' => 9.47 ,  'ta' => 6.08 , 'at' => 6.08},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'twist_CHARMM27' => {
							'simple'    => 'twist_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'rotation around the rise axis (z axis) of B DNA. ( rotational deformability ). Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 0.034 , 'tg' => 0.034 ,  'aa' => 0.043 , 'tt' => 0.043 ,  'ag' => 0.036 , 'tc' => 0.036 ,  'at' => 0.032 , 'ta' => 0.032 ,  'ca' => 0.032 , 'gt' => 0.032 ,  'cc' => 0.03 , 'gg' => 0.03 ,  'cg' => 0.032 , 'gc' => 0.032 ,  'ga' => 0.04 , 'ct' => 0.04 ,  'gc' => 0.027 , 'cg' => 0.027 ,  'ta' => 0.036 , 'at' => 0.036},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'tilt_CHARMM27' => {
							'simple'    => 'tilt_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'rotation around the shift axis (x axis) of B DNA ( rotational deformability).Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 0.034 , 'tg' => 0.034 ,  'aa' => 0.044 , 'tt' => 0.044 ,  'ag' => 0.045 , 'tc' => 0.045 ,  'at' => 0.032 , 'ta' => 0.032 ,  'ca' => 0.027 , 'gt' => 0.027 ,  'cc' => 0.043 , 'gg' => 0.043 ,  'cg' => 0.024 , 'gc' => 0.024 ,  'ga' => 0.041 , 'ct' => 0.041 ,  'gc' => 0.031 , 'cg' => 0.031 ,  'ta' => 0.021 , 'at' => 0.021},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'roll_CHARMM27' => {
							'simple'    => 'roll_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'rotation around the slide axis (y axis) of B DNA  (rotational deformability ). Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 0.025 , 'tg' => 0.025 ,  'aa' => 0.022 , 'tt' => 0.022 ,  'ag' => 0.022 , 'tc' => 0.022 ,  'at' => 0.023 , 'ta' => 0.023 ,  'ca' => 0.018 , 'gt' => 0.018 ,  'cc' => 0.021 , 'gg' => 0.021 ,  'cg' => 0.017 , 'gc' => 0.017 ,  'ga' => 0.024 , 'ct' => 0.024 ,  'gc' => 0.028 , 'cg' => 0.028 ,  'ta' => 0.015 , 'at' => 0.015},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'shift_CHARMM27' => {
							'simple'    => 'shift_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'displacement along an axis (x axis) in the base-pair plane perpendicular to the first, directed from the minor to the major groove, of B DNA (translational deformability).Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 1.55 , 'tg' => 1.55 ,  'aa' => 2.45 , 'tt' => 2.45 ,  'ag' => 2 , 'tc' => 2 ,  'at' => 1.21 , 'ta' => 1.21 ,  'ca' => 1.6 , 'gt' => 1.6 ,  'cc' => 1.53 , 'gg' => 1.53 ,  'cg' => 1.82 , 'gc' => 1.82 ,  'ga' => 2.27 , 'ct' => 2.27 ,  'gc' => 1.7 , 'cg' => 1.7 ,  'ta' => 0.93 , 'at' => 0.93},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'slide_CHARMM27' => {
							'simple'    => 'slide_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'displacement along an axis ( y axi) in the plane of the base pair directed from one strand to the other,of B DNA (translational deformability).Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 3.33 , 'tg' => 3.33 ,  'aa' => 3.56 , 'tt' => 3.56 ,  'ag' => 2.82 , 'tc' => 2.82 ,  'at' => 3.49 , 'ta' => 3.49 ,  'ca' => 2.19 , 'gt' => 2.19 ,  'cc' => 1.74 , 'gg' => 1.74 ,  'cg' => 2.48 , 'gc' => 2.48 ,  'ga' => 3.4 , 'ct' => 3.4 ,  'gc' => 4.79 , 'cg' => 4.79 ,  'ta' => 1.52 , 'at' => 1.52},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282',
			},
			'rise_CHARMM27' => {
							'simple'    => 'rise_CHARMM27',
							'ktuple'    => 2,
							'details'   => 'displacement along the helix axis (z axis),of B DNA (translational deformability).Derived from atomistic MD simulations (CHARMM27 force field 94) in water for a small set of duplexes cointaining all unique dinucleotide steps. Helical force-constants are derivedby inversion of the covariance matrix in helical spaceand assuming harmonic oscillations. The neigbhbour approach is used.The rotational values are in kcal/mol deg2 and translational ones are in kcal/mol A2.',
							'data'      => {'ac' => 8.31 , 'tg' => 8.31 ,  'aa' => 9.47 , 'tt' => 9.47 ,  'ag' => 9.35 , 'tc' => 9.35 ,  'at' => 7.32 , 'ta' => 7.32 ,  'ca' => 6.71 , 'gt' => 6.71 ,  'cc' => 8.96 , 'gg' => 8.96 ,  'cg' => 6.64 , 'gc' => 6.64 ,  'ga' => 10.12 , 'ct' => 10.12 ,  'gc' => 9.43 , 'cg' => 9.43 ,  'ta' => 6.61 , 'at' => 6.61},
							'min_value' => 'NA',
							'max_value' => 'NA',
							'refrence'  => 'PMID:18299282'
			},
	);

	foreach my $dataType (keys %$hash_ref) {
		
		if ($dataType =~ /^array$/){
			
			my @temp = keys %ruleCataloge;
			return @temp;
		}
		elsif ($dataType =~ /^string$/) {
			
			my $propName     = ${ $hash_ref->{'string'} }->[0];
			my $keyTypeParam = ${ $hash_ref->{'string'} }->[1];
			my $str          = "";
			
			if (! exists $ruleCataloge{$propName}) {
				$str =  "property $propName does not match the avaible rules/properties" ;
			}
			else {
				if ($keyTypeParam !~ /^all$/) {
					$str = "$keyTypeParam : $ruleCataloge{$propName}{$keyTypeParam}"; 
				}
				else {
					foreach my $key (sort {$a cmp $b} keys %{$ruleCataloge{$propName}{$keyTypeParam} } ) {
						$str .= "$keyTypeParam : $ruleCataloge{$propName}{$keyTypeParam} \n"; 
					}
				}
			}
			return $str
		}
		else {
			croak "does not match any data stucture";
		}
	}
}

=head2 available_nuc_rules
Title     : available_nuc_rules
Usage     : $obj->available_nuc_rules();
Function  : get the list of supported rules/properties
Returns   : @(array)
Argument  : none
=cut
sub available_nuc_rules {
	my($self) = @_;
	my @listRule = _get_rule_cataloge({'array'=>'simple'});
	return @listRule;
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
    my($self,$hash_ref) = @_;
    my $prop = keys %$hash_ref;
    return "$prop : $hash_ref->{$prop}";
	#~ my $str = _get_rule_cataloge({
									#~ 'string'=> [ $prop , $hash_ref->{$prop} ]
								 #~ });
	my $str="";return $str;
}

=head1 AUTHOR

abuzar hamza, C<< <abuzarhamza at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-nucsurf at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NucSURF>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc NucSURF::RuleCataloge


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=NucSURF>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/NucSURF>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/NucSURF>

=item * Search CPAN

L<http://search.cpan.org/dist/NucSURF/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 abuzar hamza.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of NucSURF::RuleCataloge

