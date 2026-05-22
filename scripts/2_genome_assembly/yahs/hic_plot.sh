#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH --mem=8G
#SBATCH -J hic_plot
#SBATCH -o hic_plot.out
#SBATCH -e hic_plot.err

cd /home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs

# Load modules
module load YaHS/1.2.2-foss-2024a
module load SAMtools/1.22.1-GCC-13.3.0
module load Java/17
module load pyGenomeTracks/3.9-foss-2024a
module load pairix
module load pairtools/1.1.2-gfbf-2024a

# Download the new Juicer Tools Jar directly from GitHub's v3.0 release
wget -O juicer_tools.jar \
https://hicfiles.tc4ga.com/public/juicer/juicer_tools_1.22.01.jar

# 2. Make chrom.sizes from the YaHS-scaffolded assembly
samtools faidx yahs_scaffolds_final.fa
cut -f1,2 yahs_scaffolds_final.fa.fai > scaffolds.chrom.sizes

# 3. BAM -> .pairs.gz (4DN format, upper-triangle, sorted)
#bam2pairs -c chrom.sizes hic.final.sorted.bam hic
# produces hic.bsorted.pairs.gz

pairtools parse -c /home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs/scaffolds.chrom.sizes -o hic.pairs.gz --drop-sam /home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs/hic.final.sorted.bam

# 4. Build the .hic
java -Xmx8g -jar juicer_tools.jar pre \
    /home/mila6004/Genomeanalysis/results/2_genome_assembly/yahs/hic.pairs.gz \
    hic.hic \
    $(pwd)/scaffolds.chrom.sizes
