# Somatic Variant Calling Pipeline — Cancer Genomics

*A bioinformatics pipeline that identifies cancer-driving mutations by comparing DNA from tumor tissue against matched healthy tissue from the same patient.*

## What This Project Does

Cancer is caused by mutations — changes in DNA that make cells grow uncontrollably. This pipeline takes raw DNA sequencing data from a tumor sample and its matched normal (healthy) sample, and identifies which mutations are specific to the tumor — i.e., which genetic changes are actually driving the cancer, versus normal genetic variation everyone has.

I built this end-to-end pipeline using the COLO829 melanoma (skin cancer) cell line, a standard reference dataset used in cancer genomics research, and successfully identified a mutation in *BRAF* — one of the most well-known cancer-driving genes, frequently mutated in melanoma. This is a strong validation result, since it's exactly the kind of finding this analysis is designed to catch.

## Skills Demonstrated

- *Command-line / Linux proficiency* — built and debugged a 10-step pipeline entirely via shell scripting on a Linux virtual machine
- *Bioinformatics tool orchestration* — configured and chained together industry-standard tools (GATK4, BWA, Picard, samtools, VEP)
- *Data quality control* — assessed and validated sequencing data quality at multiple pipeline stages
- *Problem-solving* — diagnosed and resolved real-world technical issues (dependency conflicts, memory constraints, corrupted files) independently
- *Reproducibility* — wrote clean, numbered, documented scripts so the entire analysis can be re-run by anyone from scratch
- *Data interpretation* — filtered thousands of raw genetic variants down to a small, biologically meaningful set, and correctly identified a known cancer gene mutation

## The Pipeline, Step by Step

| Step | What Happens | Why It Matters |
|---|---|---|
| 1. Quality Control | Check raw sequencing data for errors | Bad data in = bad results out |
| 2. Trimming | Remove low-quality bases and technical artifacts | Cleans up the raw data before analysis |
| 3. Alignment | Map DNA reads to the human reference genome | Figures out where in the genome each piece of DNA came from |
| 4. Sorting/Indexing | Organize the mapped data for fast access | Required for downstream tools to work efficiently |
| 5. Duplicate Marking | Flag PCR-duplicated reads | Prevents the same DNA fragment from being counted multiple times |
| 6. Contamination Check | Verify the tumor and normal samples aren't mixed up | Ensures data integrity before calling mutations |
| 7. Coverage Analysis | Measure how thoroughly each region was sequenced | Confirms enough data exists to trust the results |
| 8. Variant Calling | Compare tumor vs. normal to find tumor-specific mutations | The core analysis — this is where mutations are actually detected |
| 9. Filtering | Remove low-confidence, likely-false mutations | Keeps only high-quality, trustworthy results |
| 10. Annotation | Determine what each mutation actually does to the affected gene/protein | Turns raw DNA changes into biological meaning |

## Results

- Processed *~1.5 million sequencing reads* across both samples
- Identified *2,543 high-confidence mutations* after quality filtering (down from 3,273 raw candidates)
- Confirmed *less than 1% sample contamination*, validating data quality
- *Key finding:* identified a mutation in **BRAF**, a gene famously linked to melanoma and used clinically to guide cancer treatment decisions — this is a well-known "positive control" result that confirms the pipeline correctly detects real, medically relevant mutations

## Tools Used

FastQC · Trimmomatic · BWA · samtools · Picard · GATK4 (MuTect2) · Ensembl VEP

## Repository Contents

- scripts/ — all 10 pipeline scripts, numbered and documented, ready to run in sequence
- results/ — final filtered mutation results with functional annotations

---

This project was completed as part of the EMBL-EBI Cancer Genomics and Transcriptomics Course 2024, using publicly available reference data from the COLO829 melanoma cell line (Valle-Inclan et al., 2022).

## Additional Result Files

- results/04_mutect2/mutect2.vcf — raw, unfiltered MuTect2 variant calls (3,273 variants)
- results/04_mutect2/mutect2_pass.vcf — PASS-filtered high-confidence variant calls (2,543 variants)
