#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 40:00:00
#SBATCH --mem=32G
#SBATCH -J flye
#SBATCH -o flye.out
#SBATCH -e flye.err

module load Flye/2.9.6-GCC-13.3.0

flye \
--nano-raw /gorilla/home/mila6004/Genomeanalysis/results/1_preprocessing/Nanopore_long_reads/Nanofilt/Nanofilt_Nanopore.fastq.gz \
--out-dir /gorilla/home/mila6004/Genomeanalysis/results/2_genome_assembly/flye \
--genome-size 40m \
--threads 2
