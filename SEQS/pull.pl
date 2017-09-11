#! /usr/bin/env perl

use strict; 
use warnings;

# ================== Parse arguments

if( @ARGV < 2 ){
    print "******** Requires 2 arguments!!\n";
    print "USAGE: pull.pl [pattern/protein] [filename]\n";
    print "   pull out sequences that contain a given \n";
    print "   pattern in the name, like a protein name \n";
    exit(0);
}

my $pat=$ARGV[0];
my $file=$ARGV[1];

# ================== Variables
my $line="";
my $keep=0;          # 0 or 1 if we should keep the sequence
my $seq="";          # sequence that is kept

# ================== Functions
sub match{
    if($line =~ $pat){
	$keep=1;
    }else{
	$keep=0;
    }
}

# ================== Start processing file

open(my $fh,"<:encoding(UTF-8)",$file) or die "Can't open < $file: $!";

while(<$fh>){
    $line=$_;
    if(/^>/){             # if line is a header
	if($keep==1){     #    if there is a previously kept sequence
	    print $seq;   #    print kept sequence
	    $seq="";      #    clear sequence
	    $keep=0;      #    reset the keep indicator
	}

	match;            # check if current header matches pattern
    }

    if($keep==1){         # if pattern was matched, keep sequence
	$seq=$seq.$line;
    }
}

if($keep==1){             # print out last kept sequence if haven't already
    print $seq;
    $seq="";
    $keep=0;
}
