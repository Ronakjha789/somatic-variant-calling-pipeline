#!/bin/bash
# Step 2: Trim adapters using Trimmomatic

mkdir -p results/02_trimming

ADAPTERS=/media/sf_somatic_variant_calling/datasource/genomics/references/adapters.fa

# Trim normal sample (COLO829BL)
trimmomatic PE -phred33 \
  data/COLO829BL.R1.fastq.gz data/COLO829BL.R2.fastq.gz \
  results/02_trimming/COLO829BL_T.R1.fastq.gz results/02_trimming/COLO829BL_U.R1.fastq.gz \
  results/02_trimming/COLO829BL_T.R2.fastq.gz results/02_trimming/COLO829BL_U.R2.fastq.gz \
  ILLUMINACLIP:$ADAPTERS:2:30:10

# Trim tumour sample (COLO829T)
trimmomatic PE -phred33 \
  data/COLO829T.R1.fastq.gz data/COLO829T.R2.fastq.gz \
  results/02_trimming/COLO829T_T.R1.fastq.gz results/02_trimming/COLO829T_U.R1.fastq.gz \
  results/02_trimming/COLO829T_T.R2.fastq.gz results/02_trimming/COLO829T_U.R2.fastq.gz \
  ILLUMINACLIP:$ADAPTERS:2:30:10
