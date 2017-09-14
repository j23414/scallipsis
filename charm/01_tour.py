#! /usr/bin/env python

import argparse

# parse arguments
parser = argparse.ArgumentParser(description='Python feature tour.')

parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)')

args = parser.parse_args()


# echo statements
print "Hello world"

# variables
var1=100           # integer
var2=1000.0        # floating point
var3="hello world" # string

print(var1)
print var1+var2
print var2
print var3+var3
print var3,var2    # when printing different types, use comma

# multiple assignment
a=b=c=1          # same
print a,b,c
a,b,c=1,2,"john" # diff
print a,b,c

# clean up
del var1,var2,var3,a,b,c

# datatypes: number, string, list, tuple, dictionary
str="Hello World"
print str
print str[0]
print str[2:5]
print str[2:]
print str*2
print str+"Test"

list=['abcd',786,2.23,'john',70.2]
tinylist=[123,'john']

print list
print list[0]
print list[1:3]
print list[2:]
print tinylist*2
print list+tinylist

# tuples are read-only lists, cannot be changed
tuple=('abcd',786,2.23,'john',70.2)
tinytuple=(123,'john')

print tuple
print tuple[0]
print tuple[1:3]
print tuple[2:]
print tinytuple*2
print tuple+tinytuple

list[2]=1000 # valid
#tuple[2]=1000 # invalid

# dict is like perl hashes
dict={}
dict['one']='This is one'
dict[2]='this is two'
tinydict={'name':'john','code':6734,'dept':'sales'}

print dict['one']
print dict[2]
print tinydict
print tinydict.keys()
print tinydict.values()

# converts object x to an expression string
#repr(x)
#eval(str)

print ('john' in tinydict.values())

# control statements

if(1==1):print "Values are equal"
