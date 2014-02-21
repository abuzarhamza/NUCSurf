use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'NUCSurf',
    AUTHOR           => q{abuzar hamza <abuzarhamza@gmail.com>},
    VERSION_FROM     => 'lib/NUCSurf.pm',
    ABSTRACT         => 'NUCSurf.pm',
    ABSTRACT_FROM    => 'NUCSurf.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        #s'FASTAParse'   => 0.0.3,
        'Test::More'   => 0,
        'Test::Simple' => 0,
    },
    PREREQ_PM => {
        'FASTAParse'   => 0.0.3,
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'NUCSurf-*' },
);
