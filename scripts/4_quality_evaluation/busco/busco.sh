#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH --mem=16G
#SBATCH -J busco
#SBATCH -o busco.out
#SBATCH -e busco.err

module load BUSCO/5.8.2-gfbf-2024a

cd /home/mila6004/Genomeanalysis/results/4_quality_evaluation/busco

busco \
-I /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
-l embryophyta_odb10 \
-o busco \
-m genome \
-c 2
