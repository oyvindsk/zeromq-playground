#!/usr/bin/env perl

use strict;
use warnings;

use 5.012;

use Data::Dumper;
use ZeroMQ qw/:all/;

my $cxt = ZeroMQ::Context->new;

my $sock = $cxt->socket(ZMQ_PUB);

$sock->bind('tcp://127.0.0.1:9999');

# http://nichol.as/zeromq-an-introduction

my @countries   = ('netherlands','brazil','germany','portugal');
my @events      = ('yellow card', 'red card', 'goal', 'corner', 'foul');

while(1){

    my $country = $countries[  int( rand( @countries ) ) ];
    my $event   = $events[ int( rand( @events ) ) ];
    my $msg = "$country $event";

    say "Publishing: '$msg'";
    $sock->send($msg);

    sleep 1;

}

