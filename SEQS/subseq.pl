#! /usr/bin/env perl

use strict;
use warnings;

# ======================== Variables

# ======================== Functions

my $header="";
my $seq="";
my $start=0;
my $end=10;

sub printSubSeq{
    print substr($seq,$start,$end-$start+1);
    print "\t${start}..${end}\t$header\n";
}

# ======================== Process
while(<>){
    chomp;
    if(/^>(.+)/){
	if(length($header)>0){
	    printSubSeq;
	}
	$header=$1;
	$seq="";
    }else{
	$seq=$seq.$_;
	$seq=~s/ //g;  # remove any spaces
    }
}

if(length($header)>0){
    printSubSeq;
}
