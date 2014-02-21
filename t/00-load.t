#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'NUCSurf' ) || print "Bail out!\n";
    use_ok( 'NUCSurf::RuleCataloge' ) || print "Bail out!\n";
    #use_ok( 'NUCSurf::RuleCataloge' ) || print "Bail out!\n";
}

diag( "Testing NUCSurf $NUCSurf::VERSION, Perl $], $^X" );
