#!/usr/bin/env bash

#pops="BA SB FO YRI GWD LWK MSL GBR CHB BEB CLM"

pops="BA SB FO LWK MSL CEU CHB"
for i in $pops; do grep -wi $i ../pca/camWorld3577.eth | awk '{print $1,$1,$4}' | shuf -n50; done > world60.ids

plink \
   --vcf ../../../data/qc1kgp_merge.vcf.gz \
   --freq \
   --within world60.ids \
   --keep world60.ids \
   --double-id \
   --keep-allele-order \
   --out world.daf

awk '$7!="0" {print $2,$3,$6}' world.daf.frq.strat > world.daf.frq

#plink \
#   --vcf ../../../data/Phase3_1kgpsnps.vcf.gz \
#   --freq \
#   --within world60.ids \
#   --keep world60.ids \
#   --double-id \
#   --keep-allele-order \
#   --out world.maf
#
#
#awk '$7!="0" && $7 <= 0.5 {print $2,$3,$6}' world.maf.frq.strat > world.maf.frq
rm world.maf.frq.strat world.daf.frq.strat
