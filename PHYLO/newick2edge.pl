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

push @arr,"n_$n";

my $ch; 
my $pos=0;
sub findNext{
    $po=index($file,"(");   $pc=index($file,")");
    $ca=index($file,",");   $co=index($file,":");    
#    print "$po\t$pc\t$ca\t$ca\t$co\n";
    if($po<0){    $po=length($file);   }
    if($pc<0){    $pc=length($file);   }
    if($ca<0){    $ca=length($file);   }
    if($co<0){    $co=length($file);   }
    if($po<$pc && $po<$ca && $po<$co){ #(
	$ch='(';
	$pos=$po;
    }elsif($pc<$po && $pc<$ca && $pc<$co){  # )
	$ch=')';
	$pos=$pc;
    }elsif($ca<$pc && $ca<$po && $ca<$co){  # ,
	$ch=',';
	$pos=$ca;
    }elsif($co<$pc && $co<$po && $co<$ca){  # : 
	$ch=':';
	$pos=$co;
    }
};

for(;$pos<length($file);){
    findNext;
#    print $ch,"\t",substr($file,0,$pos+1),"\n";
    if($ch eq '('){
	$n++;
	push @arr, "n_$n";
#	print @arr,"(\n";
	$file=substr($file,$pos+1,length($file));
    }elsif($ch eq ')'){
#	print ")\t\t",$arr[-2],"\t",$arr[-1],"\t";
	print $arr[-2],"\t",$arr[-1],"\t";
	$file=substr($file,$pos+1,length($file));
	findNext;
	if($ch eq ':'){
	    $file=substr($file,$pos+1,length($file));
	    findNext;
	    print substr($file,0,$pos),"\n";
	    $file=substr($file,$pos+1,length($file));
	}else{
	    print "0.0\n";
	}
	pop @arr;
#	print @arr,")\n";
    }elsif($ch eq ','){
	if($pos>0){
#	    print ",\t\t",$arr[-1],"\t",substr($file,0,$pos),"\n";
	    print $arr[-1],"\t",substr($file,0,$pos),"\n";
	}
	$file=substr($file,$pos+1,length($file));
    }elsif($ch eq ':'){
	if($pos>0){
#	    print ":\t\t",$arr[-1],"\t",substr($file,0,$pos),"\t";
	    print $arr[-1],"\t",substr($file,0,$pos),"\t";
	    $file=substr($file,$pos+1,length($file));
	    findNext;
	    print substr($file,0,$pos),"\n";
	    $file=substr($file,$pos,length($file));
	}else{
#	    print ")\t\t",$arr[-2],"\t",$arr[-1],"\t";
	    print $arr[-2],"\t",$arr[-1],"\t";
	    $file=substr($file,$pos+1,length($file));
	    findNext;
	    print substr($file,0,$pos),"\n";
	    if($ch eq ')'){
		pop @arr;
	    }
	    $file=substr($file,$pos,length($file));
	}
    }
}

