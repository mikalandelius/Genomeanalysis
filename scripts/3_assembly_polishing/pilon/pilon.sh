#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 30:00:00
#SBATCH --mem=32G
#SBATCH -J pilon
#SBATCH -o pilon.out
#SBATCH -e pilon.err

module load Pilon/1.24-Java-17

java -Xmx28G -jar $EBROOTPILON/pilon.jar \
--genome /home/mila6004/Genomeanalysis/results/2_genome_assembly/flye/genome.fasta \
--frags /home/mila6004/Genomeanalysis/results/2_genome_assembly/bwa/bwa.bam \
--output pilon \
--outdir /home/mila6004/Genomeanalysis/results/3_assembly_polishing/pilon \
--changes \
--vcf
