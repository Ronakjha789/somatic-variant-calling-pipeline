#!/bin/bash
# Step 6: Index reference, create sequence dictionary, generate pileup summaries,
# and estimate cross-sample contamination

mkdir -p results/04_mutect2

REF=/media/sf_somatic_variant_calling/datasource/genomics/references/chr7.fa
GERMLINE=/media/sf_somatic_variant_calling/datasource/genomics/references/1000G_phase1.snps.high_confidence.hg38.vcf.gz

# Index the reference genome (creates .fai file) - required by GATK
samtools faidx $REF

# Create sequence dictionary (creates .dict file) - required by GATK
gatk CreateSequenceDictionary -R $REF

# Generate pileup summary - tumour
gatk GetPileupSummaries \
  -I results/03_alignment/COLO829T.sorted.dupmarked.bam \
  -V $GERMLINE \
  -L chr7 \
  -O results/04_mutect2/COLO829T.pileups.table

# Generate pileup summary - normal
gatk GetPileupSummaries \
  -I results/03_alignment/COLO829BL.sorted.dupmarked.bam \
  -V $GERMLINE \
  -L chr7 \
  -O results/04_mutect2/COLO829BL.pileups.table

# Estimate contamination
gatk CalculateContamination \
  -I results/04_mutect2/COLO829T.pileups.table \
  -matched results/04_mutect2/COLO829BL.pileups.table \
  -O results/04_mutect2/contamination.table
