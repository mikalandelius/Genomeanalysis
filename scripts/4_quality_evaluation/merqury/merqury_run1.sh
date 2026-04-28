#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 10:00:00
#SBATCH --mem=32G
#SBATCH -J merqury
#SBATCH -o merqury.out
#SBATCH -e merqury.err

module load merqury/20240628-1ad7c32-gfbf-2024a

merqury.sh reads.meryl \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
/home/mila6004/Genomeanalysis/results/4_quality_evaluation/merqury/run1
