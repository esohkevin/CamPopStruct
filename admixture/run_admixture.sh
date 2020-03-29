#!/bin/bash

world="../world/"
convert="../world/CONVERTF/"

# Perform admixture cross-validation to determine the appropriate k value to use

if [[ $# == 3 ]]; then

   inbed="$1"
   fnseq="$2"
   tnseq="$3"
   seq $tnseq -1 $fnseq | parallel echo --cv ${inbed}.bed {} -B300 -j15 | xargs -P5 -n5 admixture
   
   #./plotQestimate.sh log.out
else
    echo """
	Usage:./run_admixture.sh <input-bed-root> <from K> <to K> [from ? to ? number of K params]
    """
fi
