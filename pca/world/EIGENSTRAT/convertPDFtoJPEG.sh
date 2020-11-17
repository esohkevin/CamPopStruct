#!/usr/bin/env bash

#pdftoppm -jpeg -r 1200 AfrPCA.pdf AfrPCA.conv

#   if [ $# -lt 1 ]; then 
#      echo "Enter at least one .pdf file to convert to .eps"
#   else
#   
#      inkscape -d 300 --export-type=eps --export-margin=10 "$@"
#   
#   fi
#--export-type=[...]                        File type(s) to export: [svg,png,ps,eps,pdf,emf,wmf,xaml]
inkscape -d 300 --export-type=eps --pdf-page=1 --export-margin=10 ~/JKUAT_Proposal/fine_structure/manu/all_figs.pdf -o ~/JKUAT_Proposal/fine_structure/manu/figure1_fst_pca
inkscape -d 300 --export-type=eps --pdf-page=2 --export-margin=10 ~/JKUAT_Proposal/fine_structure/manu/all_figs.pdf -o ~/JKUAT_Proposal/fine_structure/manu/figure2_afr_cam
inkscape -d 300 --export-type=eps --pdf-page=3 --export-margin=10 ~/JKUAT_Proposal/fine_structure/manu/all_figs.pdf -o ~/JKUAT_Proposal/fine_structure/manu/figure3_adm_cam
inkscape -d 300 --export-type=eps --pdf-page=4 --export-margin=10 ~/JKUAT_Proposal/fine_structure/manu/all_figs.pdf -o ~/JKUAT_Proposal/fine_structure/manu/figure4_iHS
inkscape -d 300 --export-type=eps --pdf-page=5 --export-margin=10 ~/JKUAT_Proposal/fine_structure/manu/all_figs.pdf -o ~/JKUAT_Proposal/fine_structure/manu/figure5_hflk
