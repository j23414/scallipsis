#! /usr/bin/env perl

use strict;
use warnings;

# ======================== Variables

# ======================== Functions

my $header="";
my $seq="";

sub printLen{
    print length($seq);
    print "\t$header\n";
}

# ======================== Process
while(<>){
    chomp;
    if(/^>(.+)/){
	if(length($header)>0){
	    printLen;
	}
	$header=$1;
	$seq="";
    }else{
	$seq=$seq.$_;
	$seq=~s/ //g;  # remove any spaces
    }
}

if(length($header)>0){
    printLen;
}
