#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH --mem=16G
#SBATCH -J busco_paper
#SBATCH -o busco_paper.out
#SBATCH -e busco_paper.err

module load BUSCO/5.8.2-gfbf-2024a

cd /home/mila6004/Genomeanalysis/results/4_quality_evaluation/busco

busco \
-i /home/mila6004/Genomeanalysis/data/paper/chr3_paper.fa \
-l embryophyta_odb10 \
-o busco_paper \
-m genome \
-c 2
