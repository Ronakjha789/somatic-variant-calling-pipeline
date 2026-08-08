#!/bin/bash
# Step 7: Calculate depth of coverage (optional step)

REF=/media/sf_somatic_variant_calling/datasource/genomics/references/chr7.fa

gatk DepthOfCoverage \
  -R $REF \
  -L chr7 \
  -O results/04_mutect2/Coverage \
  -I results/03_alignment/COLO829T.sorted.dupmarked.bam \
  -I results/03_alignment/COLO829BL.sorted.dupmarked.bam \
  --omit-interval-statistics \
  --omit-depth-output-at-each-base
