#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'NucSURF' ) || print "Bail out!\n";
    use_ok( 'NucSURF::RuleCataloge' ) || print "Bail out!\n";
}

diag( "Testing NucSURF $NucSURF::VERSION, Perl $], $^X" );
