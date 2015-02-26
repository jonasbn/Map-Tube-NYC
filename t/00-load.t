#!perl -T

use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 5;

BEGIN {
    use_ok('Map::Tube::NYC'                       ) || print "Bail out!\n";
    use_ok('Map::Tube::NYC::Line::INDSixthAvenue' ) || print "Bail out!\n";
    use_ok('Map::Tube::NYC::Line::INDEighthAvenue') || print "Bail out!\n";
    use_ok('Map::Tube::NYC::Line::INDCrosstown'   ) || print "Bail out!\n";
    use_ok('Map::Tube::NYC::Line::IRTFlushing'    ) || print "Bail out!\n";
}

diag( "Testing Map::Tube::NYC $Map::Tube::NYC::VERSION, Perl $], $^X" );
