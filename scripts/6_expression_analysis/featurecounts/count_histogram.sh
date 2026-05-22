#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH --mem=8G
#SBATCH -J count_histogram
#SBATCH -o count_histogram.out
#SBATCH -e count_histogram.err

module load R

Rscript count_histogram.R
