#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH --mem=32G
#SBATCH -J featurecounts2
#SBATCH -o featurecounts2.out
#SBATCH -e featurecounts2.err

module load Subread/2.1.1-GCC-13.3.0

featureCounts \
-T 2 \
-p \
--countReadPairs \
-a /home/mila6004/Genomeanalysis/results/5_annotation/braker3/braker.gtf \
-s 2 \
-o featurecounts2.txt \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_1Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_1Aligned.sortedByCoord.out.bam
