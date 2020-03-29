#!/bin/bash

alder="../alder/"

if [[ $# == 3 ]]; then

#   for pop in $(cat pop.list); do shuf -n50 ../../samples/${pop}.ids; done > wthinned.txt

   pop="${1/.*/}"
   maf="$2"
   outdir="$3/"

   #----- Prepare world pops for pca and fst
   plink \
       --vcf ${alder}alder.vcf.gz \
       --extract msl.rsids \
       --indep-pairwise 50 10 0.1 \
       --keep-allele-order \
       --out pruned

   #----- Prepare world pops for pca and fst
   plink \
       --vcf ${alder}alder.vcf.gz \
       --extract msl.rsids \
       --make-bed \
       --indiv-sort f camWorld3577.eth \
       --double-id \
       --maf ${maf} \
       --threads 30 \
       --keep ${pop}.ids \
       --keep-allele-order \
       --autosome \
       --out temp-${pop}
   
   plink \
       --bfile temp-${pop} \
       --recode \
       --keep-allele-order \
       --autosome \
       --threads 30 \
       --out ${outdir}${pop}


#   #for pop in $(cat afr-pop.list | tr '[:upper:]' '[:lower:]'); do shuf -n50 ../../samples/${pop}.ids; done > athinned.txt
#   
#   #----- Prepare world pops for pca and fst
#   plink \
#       --vcf ${phase}qc1kgp_merge.vcf.gz \
#       --extract msl.rsids \
#       --indep-pairwise 5kb 50 0.1 \
#       --keep-allele-order \
#       --out pruned
#
#   #---- Prepare Africa pops for pca and fst
#   plink \
#       --vcf ${phase}qc1kgp_merge.vcf.gz \
#       --extract msl.rsids \
#       --make-bed \
#       --indiv-sort f worldPops/cam_igsr_sort.txt \
#       --keep afr.ids \
#       --double-id \
#       --maf ${amaf} \
#       --keep-allele-order \
#       --autosome \
#       --threads 30 \
#       --out temp-afr
#   
#   plink \
#       --bfile temp-afr \
#       --recode \
#       --keep-allele-order \
#       --autosome \
#       --threads 30 \
#       --out CONVERTF/afr


   rm CONVERTF/*.nosex *.nosex pruned.* temp*
   else 
       echo """
  	Usage:./prepWorldpops.sh <pop.ids> <amaf> <out-dir>

     pop.ids: Individual ID list for pop to analyze
   	amaf: MAF for PCA and Fst with Afr pops
     out-dir: Output directory e.g. world/CONVERTF/
   """
fi
