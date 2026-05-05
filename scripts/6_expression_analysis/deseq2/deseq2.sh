#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J deseq2
#SBATCH -o deseq2.out
#SBATCH -e deseq2.err

module load R

Rscript deseq2.R
