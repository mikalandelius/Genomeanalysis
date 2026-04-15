#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH --mem=32G
#SBATCH -J bwa
#SBATCH -o bwa.out
#SBATCH -e bwa.err

module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

bwa-mem2 index /home/mila6004/Genomeanalysis/results/flye/flye.fasta

bwa-mem2 mem -t 2 /home/mila6004/Genomeanalysis/results/flye/flye.fasta /home/mila6004/Genomeanalysis/data/Illumina_reads/chr3_illumina_R1.fastq.gz /home/mila6004/Genomeanalysis/data/Illumina_reads/chr3_illumina_R2.fastq.gz | samtools view -b -o bwa.bam

samtools sort -@ 2 -o bwa.sorted.bam bwa.bam

samtools index bwa.sorted.bam
