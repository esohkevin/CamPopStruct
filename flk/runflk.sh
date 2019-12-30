#!/bin/bash

p="$1"
prfx="$2"
n="$3"
nl="$4"
nh="$5"

if [[ $# == 2 && $p == "flk" ]]; then

    #--- Whole Genome flk
    hapflk --bfile boot/${prfx} --outgroup=MSL --phased -p flkout/${prfx}
    Rscript flk.R flkout/$prfx.flk

elif [[ $# == 5 && $p == "hflk" ]]; then
        
    #--- Per chromosome hapflk
    seq $nl $nh | parallel echo --bfile boot/cam-chr{}flk -K 30 --kinship flkout/camflk_fij.txt --ncpu=15 -p flkout/cam-chr{}flk | xargs -P$n -n9 hapflk

    #Rscript flk.R

else
    echo """
	Usage:./runflk.sh [flk|hflk] <in-prefix> <N> <NL> <NH>

		Enter 'flk' to run only whole genome flk or 'hflk' to run only hapflk
		prefix: Input bfile prefix. Do not specify path 
			(input will be takien from /boot and output will be saved in /flkout)
		     N: Number of jobs (chromosomes) to run eacg time (NB: Necessary for 'hapflk' only)
		    NL: Lower CHROM number; CHROM num to start with
		    NH: Higher CHROM number; CHROM num to end with
    """
fi
