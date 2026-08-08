#!/bin/bash
# Step 3: Index reference genome and align trimmed reads using BWA-MEM

mkdir -p results/03_alignment

REF=/media/sf_somatic_variant_calling/datasource/genomics/references/chr7.fa

# Index the reference genome
bwa index $REF

# Align normal sample (COLO829BL)
bwa mem -t 4 $REF \
  -R '@RG\tID:COLO829\tSM:COLO829BL\tLB:COLO829\tPL:ILLUMINA' \
  results/02_trimming/COLO829BL_T.R1.fastq.gz results/02_trimming/COLO829BL_T.R2.fastq.gz \
  > results/03_alignment/COLO829BL.sam

# Align tumour sample (COLO829T)
bwa mem -t 4 $REF \
  -R '@RG\tID:COLO829\tSM:COLO829T\tLB:COLO829\tPL:ILLUMINA' \
  results/02_trimming/COLO829T_T.R1.fastq.gz results/02_trimming/COLO829T_T.R2.fastq.gz \
  > results/03_alignment/COLO829T.sam
