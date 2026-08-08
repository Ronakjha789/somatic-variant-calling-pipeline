#!/bin/bash
# Step 1: Quality check on raw FASTQ files using FastQC

mkdir -p results/01_qc_raw

fastqc \
  data/COLO829BL.R1.fastq.gz \
  data/COLO829BL.R2.fastq.gz \
  data/COLO829T.R1.fastq.gz \
  data/COLO829T.R2.fastq.gz \
  -o results/01_qc_raw \
  --threads 4
