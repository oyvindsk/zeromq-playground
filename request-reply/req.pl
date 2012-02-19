#!/usr/bin/env perl

use strict;
use warnings;

use 5.014;

use ZeroMQ qw/:all/;

my $cxt = ZeroMQ::Context->new;

my $sock = $cxt->socket(ZMQ_REQ);

print "connecting..\n";
$sock->connect("tcp://127.0.0.1:9999");

for( 1 .. 2 ){
    print "\tsending.. $_\n";

    $sock->send("Hei hallo # $_..") ;

    my $msg = $sock->recv();

    print "\t\tgot: '" . $msg->data . "'\n";

    print "sleeping..\n";
    sleep 2;
}


print "exiting..\n";
