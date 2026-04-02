# Genome Analysis Project
The project's aim is to reproduce parts of the results from Zhou et al. (2023) with a focus on 
genome assembly and gene expression analysis of the moss species N. japonicum. 

The project uses different types of data, including Nanopore long reads, Illumina short reads, 
Illumina Hi-C reads and RNA-seq reads. 

The workflow of the project is divided into the following parts: 
- Preprocessing
- Genome assembly
- Assembly polishing
- Quality evaluation
- Annotation
- Expression analysis

The softwares used in the project are the following: 
- FastQC
- Trimmomatic
- Flye
- BWA
- Pilon
- BUSCO
- QUAST
- Merqury
- BRAKER3
- eggNOG-mapper
- YaHS
- STAR
- featureCounts
- DESeq2

The project is structured into the following folders: 
- data: contains raw sequencing data. 
- results: is divided into subfolders, one for each project part listed above. Each subfolder 
contains results from its corresponding analyses. 
- scripts: contains scripts used to run analyses. 
For a visual representation of the folder strucute, see 
folders_structure.txt. 

