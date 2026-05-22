#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH --mem=8G
#SBATCH -J quast_paper
#SBATCH -o quast_paper.out
#SBATCH -e quast_paper.err

module load QUAST/5.3.0-gfbf-2024a

cd /home/mila6004/Genomeanalysis/results/4_quality_evaluation/quast

quast \
-o quast_paper \
-t 2 \
-e \
/home/mila6004/Genomeanalysis/data/paper/chr3_paper.fa
