#!/bin/bash
# Step 9: Filter MuTect2 calls and keep only PASS variants

REF=/media/sf_somatic_variant_calling/datasource/genomics/references/chr7.fa

gatk FilterMutectCalls \
  -R $REF \
  -V results/04_mutect2/mutect2.vcf \
  --contamination-table results/04_mutect2/contamination.table \
  --min-allele-fraction 0.01 \
  -O results/04_mutect2/mutect2.filtered.vcf

grep '#\|PASS' results/04_mutect2/mutect2.filtered.vcf > results/04_mutect2/mutect2_pass.vcf
