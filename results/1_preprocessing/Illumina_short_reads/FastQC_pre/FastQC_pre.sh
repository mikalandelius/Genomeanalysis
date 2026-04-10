#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J FastQC_pre_Illumina
#SBATCH -o %J.out
#SBATCH -e %J.err
#SBATCH --mail-type=ALL

# Load module
module load FastQC/0.12.1-Java-17

# Run FastQC
fastqc \
-o /home/mila6004/Genomeanalysis/results/1_preprocessing/Illumina_short_reads/FastQC_pre \
--threads 2 \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R1.fastq.gz \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R2.fastq.gz
