#!/usr/bin/env perl

use strict;
use warnings;

use 5.012;

use Data::Dumper;
use ZeroMQ qw/:all/;

my $cxt = ZeroMQ::Context->new;

my $sock = $cxt->socket(ZMQ_SUB);

$sock->connect('tcp://127.0.0.1:9999');
$sock->setsockopt( ZMQ_SUBSCRIBE, "netherlands" );
$sock->setsockopt( ZMQ_SUBSCRIBE, "germany" );


while( my $msg = $sock->recv() ){
    say "Got msg: '" . $msg->data . "'";
}



