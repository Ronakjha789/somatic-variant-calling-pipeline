#!/bin/bash
# Step 5: Mark PCR duplicates using Picard

picard MarkDuplicates \
  I=results/03_alignment/COLO829BL.sorted.bam \
  O=results/03_alignment/COLO829BL.sorted.dupmarked.bam \
  M=results/03_alignment/COLO829BL_dupmarked_metrics.txt

picard MarkDuplicates \
  I=results/03_alignment/COLO829T.sorted.bam \
  O=results/03_alignment/COLO829T.sorted.dupmarked.bam \
  M=results/03_alignment/COLO829T_dupmarked_metrics.txt

samtools index results/03_alignment/COLO829BL.sorted.dupmarked.bam
samtools index results/03_alignment/COLO829T.sorted.dupmarked.bam
