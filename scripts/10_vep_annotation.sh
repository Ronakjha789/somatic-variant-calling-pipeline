#!/bin/bash
# Step 10: Annotate PASS-filtered MuTect2 variants with VEP

mkdir -p results/05_annotation

vep \
  -i results/04_mutect2/mutect2_pass.vcf \
  -o results/05_annotation/mutect2.pass.vep.vcf \
  --cache \
  --dir_cache /media/sf_somatic_variant_calling/vep_cache/ \
  --assembly GRCh38 \
  --offline \
  --vcf \
  --canonical
