#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J featurecounts
#SBATCH -o featurecounts.out
#SBATCH -e featurecounts.err

module load Subread/2.1.1-GCC-13.3.0

featureCounts \
-T 2 \
-p \
--countReadPairs \
-a /home/mila6004/Genomeanalysis/results/5_annotation/braker3/braker.gtf \
-o featurecounts.txt \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_1Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_2Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_3Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_treated_42_12h_1Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_treated_42_12h_2Aligned.sortedByCoord.out.bam \
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_treated_42_12h_3Aligned.sortedByCoord.out.bam
