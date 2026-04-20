#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 8
#SBATCH -t 01:00:00
#SBATCH --mem=32G
#SBATCH -J star
#SBATCH -o star.out
#SBATCH -e star.err

module load STAR/2.7.11b-GCC-13.3.0

GENDIR=star_index

READS=(
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_r2.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_2_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_2_r2.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_3_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_3_r2.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_r2.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_2_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_2_r2.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_3_f1.fq.gz
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_3_r2.fq.gz
)

cd /home/mila6004/Genomeanalysis/results/6_expression_analysis/star
if [ ! -d "$GENDIR" ]; then
mkdir -p $GENDIR

STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $GENDIR \
--genomeFastaFiles /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta
fi

# Control samples
for i in 1 2 3; do
STAR \
--runThreadN 8 \
--genomeDir $GENDIR \
--readFilesIn /home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_${i}_f1.fq.gz \
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_${i}_r2.fq.gz \
--readFilesCommand zcat \
--outFileNamePrefix Control_${i} \
--outSAMtype BAM SortedByCoordinate \
--twopassMode Basic
done

# Heat samples
for i in 1 2 3; do
STAR \
--runThreadN 8 \
--genomeDir $GENDIR \
--readFilesIn /home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_${i}_f1.fq.gz \
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_${i}_r2.fq.gz \
--readFilesCommand zcat \
--outFileNamePrefix Heat_${i} \
--outSAMtype BAM SortedByCoordinate \
--twopassMode Basic
done
