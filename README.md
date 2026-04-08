# Genome Analysis Project
The project's aim is to reproduce parts of the results from Zhou et al. (2023) with a focus on 
genome assembly and gene expression analysis of the moss species N. japonicum. 

The gene expression data will be compared between groups exposed to heat stress versus controls 
to evaluate the heat tolerance and find possible heat tolerance gene groups. Furthermore, 
more questions regarding softwares and analyses will be answered in seperate documents Questions 
for grade 4 and Questions for grade 5 located in in the Wiki. 

The project uses different types of data, including Nanopore long reads, Illumina short reads, 
Illumina Hi-C reads and RNA-seq reads. 

The workflow of the project is divided into the following parts: 
- Preprocessing
- Genome assembly
- Assembly polishing
- Quality evaluation
- Annotation
- Expression analysis

The softwares used and their usage in the project are the following: 
- FastQC: quality control
- Trimmomatic: trimming sequences
- Flye: DNA assembly
- BWA: short read mapping
- Pilon: polishing
- PepeatMasker: genome masking
- BUSCO: completeness assessment
- QUAST: quality metrics
- Merqury: k-mer validation
- BRAKER3: structural annotation
- eggNOG-mapper: functional annotation
- YaHS: Hi-C scaffolding
- STAR: RNA mapping
- featureCounts: reads counting
- DESeq2: differential expression 

The project is structured into the following folders: 
- data: contains raw sequencing data. 
- results: is divided into subfolders, one for each project part listed above. Each subfolder 
contains results from its corresponding analyses. 
- scripts: contains scripts used to run analyses. 
For a visual representation of the folder strucute, see 
folders_structure.txt. 

