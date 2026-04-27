#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 10:00:00
#SBATCH --mem=32G
#SBATCH -J merqury
#SBATCH -o merqury.out
#SBATCH -e merqury.err

module load merqury/20240628-1ad7c32-gfbf-2024a

# bygg meryl databas
meryl count k=21 output reads.meryl \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R1.fastq.gz \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R2.fastq.gz

#kör merqury
merqury.sh reads.meryl \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
/home/mila6004/Genomeanalysis/results/4_quality_evaluation/merqury
