# CamPopStruct
Fine-scale genetic structure in South Western Cameroon

Find the publication [here](https://www.nature.com/articles/s41598-020-79124-1)

**Introduction**
-------
The study included the Bantu, Semi-Bantu, and Fulani/Foulbe ethnics groups in the South West, Littorale, and Centre regions of Cameroon.
By computing measures of genetic proximity, distinct ancestral proportions for the three ethnic groups were observed. We
further found considerable differences among the Fulbe ethnic group and their Bantu and Semi-Bantu counterparts
suggestive of extensive gene flow into the ethnic group, and/or a longstanding and ongoing sympatric differentiation of the
three ethnic populations. In addition, genome scans for signatures of positive selection revealed that the three ethnic
groups may have endured differential pressures related to disease response and adaption to diet. Variants in the HLA gene
region specific to the Bantu population were akin to those previously observed in Bantu-speaking populations of Africa.The observations made in this study may have a significant bearing on genetic studies in Cameroon.

In this Project
---
- The typical GWAS quality control (QC) ([WTCCC expert filters](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3025522/)) was performed (scripts in qc)
- Wrayner Perl Script v4.2.9 was used to check/correct strand againsts the 1000 Genomes Phase 3 reference panel
- Genotypes were phased (EAGLEv2.4)
- Population Structure (PS) for QC was performed on phased data (EIGENSOFTv7, smartpca v16000) while pruning out outliers
- Samples that passed PS above where extracted from phased data into a separate VCF file for downstream analyses
- The following analyses were performed
  - Principal Component Analysis (PCA): EIGENSOFTv7 smartpca
  - Genetic Distance (Fst): EIGENSOFTv7 smartpca Fst-only
  - Model-based clustering using Admixture and Structure v2.3.4
  - Haplotype-based coancestry estimation: ChromoPainter and FineStructure 
  - Selection Scan: 
    - iHS was measured using REHHv3.0
    - Rsb (cross-population iHS) was measured
    - FLK and hapFLK were measured using hapFLKv2.4
  - Allele Frequency analysis

Useful Links
---
Check strand: https://www.well.ox.ac.uk/~wrayner/tools/HRC-1000G-check-bim-v4.2.9.zip

vcfCooker: https://github.com/statgen/gotcloud/blob/gotcloud.1.17.5/bin/vcfCooker

Human reference genome: ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz

EAGLE: https://data.broadinstitute.org/alkesgroup/Eagle/downloads/

1000 Genomes Populations: http://www.internationalgenome.org/data-portal/sample.
