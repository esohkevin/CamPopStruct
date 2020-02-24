#!/bin/bash

if [[ $# == 7 ]]; then

    #------- Set parameter variables
    base="$1"
    basen="$(basename $base)"
    k="$2"
    m="$3"
    t="$4"
    s="$5"
    o="$6"
    th="$7"
    
    #------- Create parameter files
echo """genotypename: ${base}.eigenstratgeno
snpname: ${base}.snp
indivname: ${base}.ind
evecoutname: ${o}/${basen}.pca.evec
evaloutname: ${o}/${basen}.eval
altnormstyle: NO
numoutevec: ${k}
numoutlieriter: ${m}
numoutlierevec: ${t}
outliersigmathresh: ${s}
qtmode: 0
xregionname: high-ld-regions.b37
#lsqproject: YES
outlieroutname: ${o}/${basen}.outlier
familynames: NO
#snpweightoutname: ${o}/${basen}-snpwt
#deletesnpoutname: ${o}/${basen}-eth-badsnps
numthreads: ${th}
ldregress: 200
phylipoutname: ${o}/${basen}.phy""" > ${o}/${basen}.pca.par
    
    #echo """
    #genotypename:  ../CONVERTF/${base}.eigenstratgeno
    #snpname:       ../CONVERTF/${base}.snp
    #indivname:     ../CONVERTF/${base}.ind
    #pcaname:       ${base}.pca
    #outputname:    ${base}.chisq
    #numpc:         ${k}
    #qtmode:        NO
    #""" > ${base}.chisq.par
    
    
    #------- Run the jobs
    echo "smartpca -p ${o}/${basen}.pca.par >${base}-pca.log"
          #smartpca -p ${o}/${basen}.pca.par >${base}-pca.log
    
    #echo "smarteigenstrat -p ${base}.chisq.par >${base}.chisq.log"
    #      smarteigenstrat -p ${base}.chisq.par >${base}.chisq.log
    #
    #echo "gc.perl $base.chisq $base.chisq.GC"
    #      gc.perl $base.chisq $base.chisq.GC

else 
    echo """
	Usage: ./run_eingenstrat.sh <input_prefix> <k_param> <m_param> <t_param> <s_param> <out_path> <threads>
            
             input_prefix: Prefix of EIGENSTRAT formatted files e.g. CONVERTF/world for CONVERTF/world.eigenstratgeno etc
                  k_param: Number of PCs axes e.g. 10
                  m_param: Number of outlier removal iterations (to turn off enter 0)
                  t_param: Number of PCs along which to remove outliers e.g. 10
                  s_param: Number of SD beyond which to call outliers e.g. 6.0
                 out_path: Path to EIGENSTRAT results e.g. EIGENSTRAT/
                  threads: Number of extra threads to use
    """
fi

