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

samtools view -h hic.final.sorted.bam | \
awk 'BEGIN {OFS="\t"} $1~/^@/ {next} {print $1, $3, $4, $2, $7, $8, $5, $9}' > aligned.txt

sort -k2,2d -k6,6d aligned.txt > aligned_sorted.txt

java -Xmx32g -jar /home/mila6004/Genomeanalysis/scripts/2_genome_assembly/yahs/juicer_tools.2.20.00.jar \
pre \
aligned_sorted.txt \
yahs.hic \
chrom.sizes
