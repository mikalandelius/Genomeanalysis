#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH --reservation=uppmax2026-1-61_5
#SBATCH --mem=32G
#SBATCH -J braker3
#SBATCH -o braker3.out
#SBATCH -e braker3.err

singularity exec \
-B /home/mila6004/augustus_config:/opt/Augustus/config \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
braker.pl \
--species=n_japonicum \
--genome=/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta.masked \
--softmasking \
--bam=/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Control_1Aligned.sortedByCoord.out.bam,\
/home/mila6004/Genomeanalysis/results/6_expression_analysis/star/Heat_1Aligned.sortedByCoord.out.bam \
--threads=2 \
--workingdir=/home/mila6004/Genomeanalysis/results/5_annotation/braker3
