#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH --mem=2G
#SBATCH -J braker
#SBATCH -o braker.out
#SBATCH -e braker.err

singularity exec \
	/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
	braker.pl -help
