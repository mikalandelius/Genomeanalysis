#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=16G
#SBATCH -J yahs2
#SBATCH -o yahs2.out
#SBATCH -e yahs2.err

module load YaHS/1.2.2-foss-2024a

yahs \
-o yahs \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
/home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs/hic.sorted.bam
