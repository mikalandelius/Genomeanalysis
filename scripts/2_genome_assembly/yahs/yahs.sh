#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 02:00:00
#SBATCH --mem=16G
#SBATCH -J yahs
#SBATCH -o yahs.out
#SBATCH -e yahs.err

module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0
module load YaHS/1.2.2-foss-2024a

# Step 1: Index genome
bwa index /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta

# Step 2: Map Hi-C reads
bwa-mem2 mem -5SP -t 4 \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
/home/mila6004/Genomeanalysis/data/Illumina_HiC_reads/chr3_hiC_R1.fastq.gz \
/home/mila6004/Genomeanalysis/data/Illumina_HiC_reads/chr3_hiC_R2.fastq.gz | \
samtools view -b -o hic.bam

# Step 3: Sort and index BAM
samtools sort -@ 4 -o hic.sorted.bam hic.bam
samtools index hic.sorted.bam

# Step 4: Run YaHS
yahs \
-o yahs \
/home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon/pilon.fasta \
hic.sorted.bam
