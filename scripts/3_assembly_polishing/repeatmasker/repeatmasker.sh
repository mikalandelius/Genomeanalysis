#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH --mem=16G
#SBATCH -J repeatmasker
#SBATCH -o repeatmasker.out
#SBATCH -e repeatmasker.err

module load RepeatMasker/4.2.1-foss-2024a

cd /home/mila6004/Genomeanalysis/results/3_assembly_polishing/repeatmasker

RepeatMasker \
-pa 2 \
-species plants \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta
