#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 8
#SBATCH -t 04:00:00
#SBATCH --mem=32G
#SBATCH -J star
#SBATCH -o star.out
#SBATCH -e star.err

module load STAR/2.7.11b-GCC-13.3.0

GENDIR=index_star

cd /home/mila6004/Genomeanalysis/results/6_expression_analysis/star
mkdir -p $GENDIR

# generate genome index
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $GENDIR \
--genomeFastaFiles /home/mila6004/Genomeanalysis/results/3_assembly_polishing/repeatmasker/RM_2989260.TueApr211031102026/consensi.fa \
--genomeSAindexNbases 10 \

# run mapping job
# Control samples
STAR \
--runThreadN 8 \
--genomeDir $GENDIR \
--readFilesIn /home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_f1.fq.gz \
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_r2.fq.gz \
--readFilesCommand zcat \
--outSAMstrandField intronMotif \
--outFileNamePrefix Control_1 \
--outSAMtype BAM SortedByCoordinate \

# Heat samples
STAR \
--runThreadN 8 \
--genomeDir $GENDIR \
--readFilesIn /home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_f1.fq.gz \
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_r2.fq.gz \
--readFilesCommand zcat \
--outSAMstrandField intronMotif \
--outFileNamePrefix Heat_1 \
--outSAMtype BAM SortedByCoordinate
