#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=32G
#SBATCH -J Nanofilt_Nanopore
#SBATCH -o %J.out
#SBATCH -e %J.err

module load NanoFilt/2.8.0-foss-2023b

gunzip -c /home/mila6004/Genomeanalysis/data/Nanopore_long_reads/chr3_clean_nanopore.fq.gz | \
NanoFilt -q 10 -l 500 --headcrop 10 | \
gzip > /home/mila6004/Genomeanalysis/results/1_preprocessing/Nanopore_long_reads/Nanofilt/Nanofilt_Nanopore.fastq.gz
