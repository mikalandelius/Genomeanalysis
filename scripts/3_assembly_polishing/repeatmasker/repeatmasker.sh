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
module load RepeatModeler/2.0.7-foss-2024a

cd /home/mila6004/Genomeanalysis/results/3_assembly_polishing/repeatmasker

BuildDatabase \
-name repeatmodeler_database \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta

RepeatModeler \
-database repeatmodeler_database \
-threads 2 \
-LTRStruct \

RepeatMasker \
-pa 2 \
-lib repeatmodeler_database-families.fa \
-nolow \
-xsmall \
-gff \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta
