#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J FastQC_pre_RNA
#SBATCH -o %J.out
#SBATCH -e %J.err
#SBATCH --mail-type=ALL

# Load module
module load FastQC/0.12.1-Java-17

# Run FastQC
fastqc \
-o /home/mila6004/Genomeanalysis/results/1_preprocessing/RNAseq_reads/FastQC_pre \
--threads 2 \
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_1_r2.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_2_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_2_r2.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_3_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Control_3_r2.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_1_r2.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_2_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_2_r2.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_3_f1.fq.gz \ 
/home/mila6004/Genomeanalysis/data/RNAseq_reads/Heat_treated_42_12h_3_r2.fq.gz
