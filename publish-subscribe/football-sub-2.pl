#!/usr/bin/env perl

use strict;
use warnings;

use 5.012;

use Data::Dumper;
use ZeroMQ qw/:all/;

my $cxt = ZeroMQ::Context->new;

my $sock = $cxt->socket(ZMQ_SUB);

$sock->connect('tcp://127.0.0.1:9999');
$sock->setsockopt( ZMQ_SUBSCRIBE, "" );


while( my $msg = $sock->recv() ){

    # Only care about goals.. should probably be moved to the zmq layer, possibly by publishing goals as its own stream??
    next unless $msg->data =~ /goal/;

    say "Got msg: '" . $msg->data . "'";
}



