use lib  '/home/abuzar/Desktop/github/NUCSurf/lib';
use Test::Simple tests => 1;

use NUCSurf;  

my $testObj = NUCSurf->new();

ok( defined($testObj) && ref $testObj  eq 'NUCSurf',     'NUCSurf->new() works' );

#ok( $btaste->Title      eq 'Bad Taste',     'Title() get'    );
#ok( $btaste->Director   eq 'Peter Jackson', 'Director() get' );
#ok( $btaste->Rating     eq 'R',             'Rating() get'   );
#ok( $btaste->NumExplodingSheep == 1,        'NumExplodingSheep() get' );

