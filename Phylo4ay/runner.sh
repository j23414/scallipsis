#! /usr/bin/env bash

set -e
set -u

if [ ! -d archive ]; then
    mkdir archive
fi

# Sequence alignment
#mafft --auto --jtt 200 -op 1.53 -ep 0.123 [input] > [output]
mafft --auto $1 > $1.phy

# Generate the phylogeny tree from alignment
./iqtree-omp -nt AUTO -s $1.phy > $1.phy.jclog
#./iqtree-omp -nt AUTO -s $1.phy -m TEST -bb 1000 -alrt 1000 > $1.phy.jclog
#./iqtree-omp -nt 40 -s 7070_globalH1_sw_hu_av.fasta -m TEST -bb 1000 -alrt 1000 > log1.txt

# Rename the Newick tre file
mv $1.phy.treefile $1.tre

# Cleanup. 
mv $1.phy archive/.
mv $1.phy.bionj archive/.
mv $1.phy.ckp.gz archive/.
mv $1.phy.iqtree archive/.
mv $1.phy.jclog archive/.
mv $1.phy.log archive/.
mv $1.phy.mldist archive/.
mv $1.phy.uniqueseq.phy archive/.

# Works on Mac, not on Windows, Linux
#open $1.tre

# Other possible tree building programs
#./raxml -T 2 -s $1.phy -n $1.tre -mGTRCATX -p 2623
##./raxmlHPC-PTHREADS-AVX -T 20 -s $1.phy -n H1CladeClassn.out -m GTRGAMMA -f a -k -x 12345 -p 12345 -autoMRE > log.txt
#raxmlHPC-PTHREADS-AVX -T 20 -s H1CladeClassn.fasta -n H1CladeClassn.out -m GTRGAMMA -o GU052518 -f a -k -x 12345 -p 12345 -# autoMRE > log.txt

# beast -beagle -beagle_instances 4 -beagle_CPU -beagle_SSE -beagle_scaling dynamic input.xml >log.txt 