#!/usr/bin/env perl

use strict;
use warnings;

use 5.012;

use Data::Dumper;
use ZeroMQ qw/:all/;

my $cxt = ZeroMQ::Context->new;

my $sock = $cxt->socket(ZMQ_REP);

print "binding..\n";
$sock->bind("tcp://127.0.0.1:9999");

print "waiting for msg..\n";

    
while( my $msg = $sock->recv() ){ 
    print "\tGot msg:\t'" . $msg->data ."'\n";

    print "\t\tsending reply\n";
    $sock->send("got it!");
}

print "exiting..\n";

