#!/usr/bin/env bash

pops="BA SB FO YRI GWD LWK MSL GBR CHB BEB CLM"

#  for i in ba sb fo; do
#     grep -i ${i} ../pca/cam1073.eth | \
#        shuf -n 50; done | \
#        awk '{print $1,$1}' > cam30.ids
#  
#  for i in $pops; do 
#     grep -wi $i ../pca/pca_eth_world_pops.txt | \
#        shuf -n30; done | \
#        awk '{print $1,$1}' > world30.ids
#  
#  #plink \
#  #   --vcf ${HOME}/Git/GWAS/popstruct/Phased-pca-filtered.vcf.gz \
#  #   --indep-pairwise 50 10 0.2 \
#  #   --keep-allele-order \
#  #   --extract ../eig/POPGEN/fstsnps.txt \
#  #   --out prune
#  
#  #   --extract prune.prune.in \
#  #   --maf 0.05 \
#  #   --keep cam30.ids \
#  
#  #--- CAM
#  plink \
#     --vcf ../alder/alder.vcf.gz \
#     --recode structure \
#     --extract ../pca/eig/POPGEN/fstsnps.txt \
#     --keep-allele-order \
#     --maf 0.05 \
#     --thin-count 50000 \
#     --keep cam30.ids \
#     --double-id \
#     --out cam
#  
#  #rm prune*
#  rm *.nosex
#  
sed '1,2d' cam.recode.strct_in > cam.gen
head -2 cam.recode.strct_in > cam.struct.in
cut -f3- -d' ' cam.gen > cam.gen.snps
cut -f1-2 -d' ' cam.gen  > cam.gen.col12.txt
#  
#  #--- WORLD
#  plink \
#     --vcf ../alder/alder.vcf.gz \
#     --recode structure \
#     --extract ../pca/world/POPGEN/wld.fstsnps.txt \
#     --keep-allele-order \
#     --maf 0.05 \
#     --keep world30.ids \
#     --thin-count 50000 \
#     --double-id \
#     --out world
#  
#  #rm prune*
#  rm *.nosex

sed '1,2d' world.recode.strct_in > world.gen
head -2 world.recode.strct_in > world.struct.in
cut -f3- -d' ' world.gen > world.gen.snps
cut -f1-2 -d' ' world.gen  > world.gen.col12.txt

Rscript prep_struct.R

paste cam.struct cam.gen.snps | \
   sed 's/\t/ /1' | \
   sed 's/BA/1/1' | \
   sed 's/SB/2/1' | \
   sed 's/FO/3/1' >> cam.struct.in

rm cam.gen cam.gen.snps cam.gen.col12.txt

paste world.struct world.gen.snps | \
   sed 's/\t/ /1' | \
   sed 's/BA/1/1' | \
   sed 's/SB/2/1' | \
   sed 's/FO/3/1' | \
   sed 's/BEB/4/1' | \
   sed 's/CHB/5/1' | \
   sed 's/CLM/6/1' | \
   sed 's/GBR/7/1' | \
   sed 's/GWD/8/1' | \
   sed 's/LWK/9/1' | \
   sed 's/MSL/10/1' | \
   sed 's/YRI/11/1' >> world.struct.in

rm world.gen world.gen.snps world.gen.col12.txt

grep "pass filters" cam.log | awk '{print $1}'

cs=$(grep "pass filters" cam.log | awk '{print $4}'); 
cl=$(grep "pass filters" cam.log | awk '{print $1}'); 
ws=$(grep "pass filters" world.log | awk '{print $4}'); 
wl=$(grep "pass filters" world.log | awk '{print $1}');


for k in {1..14}; do
  ./preparams.sh ${cs} ${cl} ${ws} ${wl} $k
done

#paste world.struct world.gen.snps | \
#   sed 's/\t/ /1' | \
#   sed 's/BA/1/1' | \
#   sed 's/SB/2/1' | \
#   sed 's/FO/3/1' | \
#   sed 's/ACB/4/1' | \
#   sed 's/ASW/5/1' | \
#   sed 's/BEB/6/1' | \
#   sed 's/CDX/7/1' | \
#   sed 's/CEU/8/1' | \
#   sed 's/CHB/9/1' | \
#   sed 's/CHS/10/1' | \
#   sed 's/CLM/11/1' | \
#   sed 's/ESN/12/1' | \
#   sed 's/FIN/13/1' | \
#   sed 's/GBR/14/1' | \
#   sed 's/GIH/15/1' | \
#   sed 's/GWD/16/1' | \
#   sed 's/IBS/17/1' | \
#   sed 's/ITU/18/1' | \
#   sed 's/JPT/19/1' | \
#   sed 's/KHV/20/1' | \
#   sed 's/LWK/21/1' | \
#   sed 's/MSL/22/1' | \
#   sed 's/MXL/23/1' | \
#   sed 's/PEL/24/1' | \
#   sed 's/PJL/25/1' | \
#   sed 's/PUR/26/1' | \
#   sed 's/STU/27/1' | \
#   sed 's/TSI/28/1' | \
#   sed 's/YRI/29/1' >> world.struct.in


