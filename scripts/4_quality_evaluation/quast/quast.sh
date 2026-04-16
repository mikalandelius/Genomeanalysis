#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH --mem=8G
#SBATCH -J quast
#SBATCH -o quast.out
#SBATCH -e quast.err

module load QUAST/5.3.0-gfbf-2024a

cd /home/mila6004/Genomeanalysis/results/4_quality_evaluation/quast

quast \
-o quast \
-t 1 \
-e \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta
