#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:20:00
#SBATCH --mem=8G
#SBATCH -J quast_yahs
#SBATCH -o quast_yahs.out
#SBATCH -e quast_yahs.err

module load QUAST/5.3.0-gfbf-2024a

cd /home/mila6004/Genomeanalysis/results/4_quality_evaluation/quast

quast \
-o quast_yahs \
-t 1 \
-e \
/home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs/yahs_scaffolds_final.fa
