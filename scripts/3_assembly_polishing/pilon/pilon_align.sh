#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH --mem=32G
#SBATCH -J pilon_align
#SBATCH -o pilon_align.out
#SBATCH -e pilon_align.err

module load SAMtools/1.22.1-GCC-13.3.0
module load BWA/0.7.19-GCCcore-13.3.0
module load seqtk/1.5-GCC-13.3.0

bwa index /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta

bwa mem -t 2 \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
/home/mila6004/Genomeanalysis/scripts/2_genome_assembly/flye/sub_R1.fastq \
/home/mila6004/Genomeanalysis/scripts/2_genome_assembly/flye/sub_R2.fastq | \
samtools sort -@ 2 -o pilon.sorted.bam

samtools index pilon.sorted.bam
