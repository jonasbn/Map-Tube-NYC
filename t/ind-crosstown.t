#!/usr/bin/perl

use 5.006;
use strict; use warnings;
use Test::More tests => 5;
use Map::Tube::NYC;

my $subway = Map::Tube::NYC->new;
while (<DATA>) {
    chomp;
    next if /^\#/;
    next if /^\s+$/;

    my ($description, $from, $to, $expected) = split /\|/;
    is_deeply($subway->get_shortest_route($from, $to), _expected_route($expected), $description);
}

done_testing();

sub _expected_route {
    my ($route) = @_;
    my $nodes   = [];
    foreach my $name (split /\,/,$route) {
        push @$nodes, $subway->get_node_by_name($name);
    }

    return Map::Tube::Route->new(
       { from  => $nodes->[0],
         to    => $nodes->[-1],
         nodes => $nodes });
}

__DATA__
Route 1|Broadway|Classon Avenue|Broadway,Flushing Avenue,Myrtle-Willoughby Avenues,Bedford-Nostrand Avenues,Classon Avenue
Route 2|   Broadway|Classon Avenue|Broadway,Flushing Avenue,Myrtle-Willoughby Avenues,Bedford-Nostrand Avenues,Classon Avenue
Route 3|Broadway|   Classon Avenue|Broadway,Flushing Avenue,Myrtle-Willoughby Avenues,Bedford-Nostrand Avenues,Classon Avenue
Route 4|    Broadway|   Classon Avenue|Broadway,Flushing Avenue,Myrtle-Willoughby Avenues,Bedford-Nostrand Avenues,Classon Avenue
Route 5|Broadway   |Classon Avenue  |Broadway,Flushing Avenue,Myrtle-Willoughby Avenues,Bedford-Nostrand Avenues,Classon Avenue
