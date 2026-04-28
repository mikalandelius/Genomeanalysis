#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 12:00:00
#SBATCH --mem=32G
#SBATCH -J eggnogmapper
#SBATCH -o eggnogmapper.out
#SBATCH -e eggnogmapper.err

module load eggnog-mapper/2.1.13-gfbf-2024a

emapper.py \
-i /home/mila6004/Genomeanalysis/results/5_annotation/braker3/braker.aa \
--itype proteins \
-o eggnogmapper \
--cpu 2 \
--output_dir /home/mila6004/Genomeanalysis/results/5_annotation/eggnogmapper \
--data_dir /sw/data/uppnex/eggNOG/5.0/rackham/
