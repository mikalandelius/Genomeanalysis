#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 8
#SBATCH -t 30:00:00
#SBATCH --mem=32G
#SBATCH -J star2
#SBATCH -o star2.out
#SBATCH -e star2.err

module load STAR/2.7.11b-GCC-13.3.0

GENDIR=index_star
READDIR=/home/mila6004/Genomeanalysis/data/RNAseq_reads

cd /home/mila6004/Genomeanalysis/results/6_expression_analysis/star
mkdir -p $GENDIR

# generate genome index
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $GENDIR \
--genomeFastaFiles /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta.masked \
--genomeSAindexNbases 10 \

# -------- CONTROL SAMPLES --------
controls=("Control_1" "Control_2" "Control_3")

for sample in "${controls[@]}"; do
    STAR \
    --runThreadN 8 \
    --genomeDir $GENDIR \
    --readFilesIn ${READDIR}/${sample}_f1.fq.gz ${READDIR}/${sample}_r2.fq.gz \
    --readFilesCommand zcat \
    --outSAMstrandField intronMotif \
    --outFileNamePrefix ${sample} \
    --outSAMtype BAM SortedByCoordinate
done

# -------- HEAT SAMPLES --------
heats=("Heat_treated_42_12h_1" "Heat_treated_42_12h_2" "Heat_treated_42_12h_3")

for sample in "${heats[@]}"; do
    STAR \
    --runThreadN 8 \
    --genomeDir $GENDIR \
    --readFilesIn ${READDIR}/${sample}_f1.fq.gz ${READDIR}/${sample}_r2.fq.gz \
    --readFilesCommand zcat \
    --outSAMstrandField intronMotif \
    --outFileNamePrefix ${sample} \
    --outSAMtype BAM SortedByCoordinate
done
