#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=32G
#SBATCH -J juicerbox
#SBATCH -o juicerbox.out
#SBATCH -e juicerbox.err

module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0
module load Java/25.36

cd /home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs

bwa-mem2 index yahs_scaffolds_final.fa

bwa-mem2 mem -5SP -t 2 \
yahs_scaffolds_final.fa \
/home/mila6004/Genomeanalysis/data/Illumina_HiC_reads/chr3_hiC_R1.fastq.gz \
/home/mila6004/Genomeanalysis/data/Illumina_HiC_reads/chr3_hiC_R2.fastq.gz | \
samtools sort -@ 2 -o hic.final.sorted.bam

samtools index hic.final.sorted.bam

java \
-jar /home/mila6004/Genomeanalysis/scripts/2_genome_assembly/yahs/juicer_tools.2.20.00.jar \
pre \
hic.final.sorted.bam \
aligned.txt \
chrom.sizes

sort -k2,2d -k6,6d aligned.txt > aligned_sorted.txt

java -jar /home/mila6004/Genomeanalysis/scripts/2_genome_assembly/yahs/juicer_tools.2.20.00.jar \
pre \
aligned_sorted.txt \
yahs.hic \
chrom.sizes
