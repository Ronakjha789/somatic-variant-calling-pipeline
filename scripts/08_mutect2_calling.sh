#!/bin/bash
# Step 8: Somatic variant calling with GATK4 MuTect2

REF=/media/sf_somatic_variant_calling/datasource/genomics/references/chr7.fa
GERMLINE=/media/sf_somatic_variant_calling/datasource/genomics/references/1000G_phase1.snps.high_confidence.hg38.vcf.gz
PON=/media/sf_somatic_variant_calling/datasource/genomics/references/1000g_pon.hg38.vcf.gz

gatk Mutect2 \
  -R $REF \
  -I results/03_alignment/COLO829T.sorted.dupmarked.bam \
  -I results/03_alignment/COLO829BL.sorted.dupmarked.bam \
  -normal COLO829BL \
  -tumor COLO829T \
  --germline-resource $GERMLINE \
  --panel-of-normals $PON \
  -O results/04_mutect2/mutect2.vcf \
  -L chr7
