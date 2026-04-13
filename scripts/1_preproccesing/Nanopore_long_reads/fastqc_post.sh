#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:20:00
#SBATCH --mem=20G
#SBATCH -J Fastqc_post_nanopore
#SBATCH -o FastQC_post_nanopore.out
#SBATCH -e FastQC_post_nanopore.err

module load FastQC/0.12.1-Java-17

export _JAVA_OPTIONS="-Xmx16g"

fastqc \
-o /gorilla/home/mila6004/Genomeanalysis/results/1_preprocessing/Nanopore_long_reads/FastQC_post \
/gorilla/home/mila6004/Genomeanalysis/results/1_preprocessing/Nanopore_long_reads/Nanofilt/Nanofilt_Nanopore.fastq.gz
