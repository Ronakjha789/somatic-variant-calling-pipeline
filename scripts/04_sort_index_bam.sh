#!/bin/bash
# Step 4: Sort, index, and generate stats for aligned BAM files

samtools sort -o results/03_alignment/COLO829BL.sorted.bam results/03_alignment/COLO829BL.sam
samtools sort -o results/03_alignment/COLO829T.sorted.bam results/03_alignment/COLO829T.sam

samtools index results/03_alignment/COLO829BL.sorted.bam
samtools index results/03_alignment/COLO829T.sorted.bam

samtools stats results/03_alignment/COLO829BL.sorted.bam > results/03_alignment/COLO829BL.sorted.bam_stats.txt
samtools stats results/03_alignment/COLO829T.sorted.bam > results/03_alignment/COLO829T.sorted.bam_stats.txt
