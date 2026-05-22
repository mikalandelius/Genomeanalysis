#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH --mem=32G
#SBATCH -J flye_align
#SBATCH -o flye_align.out
#SBATCH -e flye_align.err

module load SAMtools/1.22.1-GCC-13.3.0
module load BWA/0.7.19-GCCcore-13.3.0
module load seqtk/1.5-GCC-13.3.0

seqtk sample -s100 \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R1.fastq.gz \
0.1 > sub_R1.fastq
seqtk sample -s100 \
/home/mila6004/Genomeanalysis/data/Illumina_short_reads/chr3_illumina_R2.fastq.gz \
0.1 > sub_R2.fastq

bwa mem -t 2 \
/home/mila6004/Genomeanalysis/results/2_genome_assembly/flye/assembly.fasta \
sub_R1.fastq \
sub_R2.fastq | \
samtools sort -@ 2 -o flye.sorted.bam

samtools index flye.sorted.bam
