#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J Fastqc_pre_Nanopore
#SBATCH -o FastQC_pre_Nanopore.out
#SBATCH -e FastQC_pre_Nanopore.err
#SBATCH --mail-type=ALL

# Load module
module load FastQC/0.12.1-Java-17

# Run FastQC
fastqc \
-o /home/mila6004/Genomeanalysis/results/1_preprocessing/Nanopore_long_reads/FastQC_pre \
--threads 2 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz
