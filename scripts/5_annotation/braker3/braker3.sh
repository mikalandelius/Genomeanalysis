#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 20:00:00
#SBATCH --mem=32G
#SBATCH -J braker3
#SBATCH -o braker3.out
#SBATCH -e braker3.err

module load BRAKER/3.0.8-foss-2024a

braker.pl \
--species=n_japonicum \
--genome=/home/mila6004/Genomeanalysis/results/3_assembly_polishing/repeatmasker/RM_2989260.TueApr211031102026/consensi.fa \
--UTR=on \
--bam=/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_1Aligned.sortedByCoord.out.bam,\
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_1Aligned.sortedByCoord.out.bam \
--threads=2 \
--busco_lineage=viridiplantae_odb10
