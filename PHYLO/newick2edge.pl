#! /usr/bin/env perl

use strict;
use warnings;

my $file;

my $n=0; # internal node numbers

my @arr; # push and pop current node numbers

while(<>){
    chomp;
    $file=$file.$_;
}

my $po=-1; # (
my $pc=-1; # )
my $ca=-1; # ,
my $co=-1; # :
my $min=-1; 

push @arr="n_$n";
my $prev="n_$n";

for(my $i=0; $i<10; $i++){
    $po=index($file,"(");
    $pc=index($file,")");
    $ca=index($file,",");
    $co=index($file,":");
    print "$po, $pc, $ca\t";
    if($po<0){
	$po=length($file);
    }
    if($pc<0){
	$pc=length($file);
    }
    if($ca<0){
	$ca=length($file);
    }
    if($co<0){
	$co=length($file);
    }
    if($po<$pc && $po<$ca && $po<$co){
	print substr($file,0,$po+1),"\n";   	
	if($po>0){
	    $prev=substr($file,0,$po);
	}
	$file=substr($file,$po+1,length($file));
	$n++;
	push @arr="n_$n";
    }elsif($pc<$po && $pc<$ca && $pc<$co){
	print substr($file,0,$pc+1),"\n";   	
	$file=substr($file,$pc+1,length($file));
	$prev=pop @arr;
    }elsif($ca<$pc && $ca<$po && $ca<$co){
	print substr($file,0,$ca+1),"\n";   	
	$file=substr($file,$ca+1,length($file));
    }elsif($co<$pc && $co<$po && $co<$ca){
	print substr($file,0,$co+1),"\n";   	
	$file=substr($file,$co+1,length($file));
    }
}

