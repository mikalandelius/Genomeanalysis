library(DESeq2)

# Läs in featureCounts-output
fc <- read.table(
  "/home/mila6004/Genomeanalysis/scripts/6_expression_analysis/featurecounts/featurecounts.txt",
  header = TRUE,
  row.names = 1,
  comment.char = "#",
  check.names = FALSE
)

# Ta bort annotation-kolumner
# (Chr, Start, End, Strand, Length)
countData <- fc[,6:ncol(fc)]

# Förenkla sample-namn
colnames(countData) <- gsub(".*\\/", "", colnames(countData))
colnames(countData) <- gsub("Aligned.sortedByCoord.out.bam", "", colnames(countData))

# Kontrollera sample-namn
print(colnames(countData))

# Skapa metadata
colData <- data.frame(
  row.names = colnames(countData),
  condition = c(
    "control",
    "control",
    "control",
    "heat",
    "heat",
    "heat"
  )
)

# Kontrollera att metadata matchar counts
print(colData)

# Skapa DESeq2 dataset
dataset <- DESeqDataSetFromMatrix(
  countData = countData,
  colData = colData,
  design = ~ condition
)

# Filtrera bort gener med väldigt låga counts
dataset <- dataset[rowSums(counts(dataset)) > 10, ]

# Kör DESeq2
dataset <- DESeq(dataset)

# Hämta resultat
result <- results(dataset)

# Sortera efter adjusted p-value
result <- result[order(result$padj), ]

# Visa toppresultat
head(result)

# Spara resultat
write.csv(
  as.data.frame(result),
  file = "/home/mila6004/Genomeanalysis/results/6_expression_analysis/deseq2/results.csv"
)

# PCA
vsd <- vst(dataset, blind = FALSE)

pcaData <- plotPCA(
  vsd,
  intgroup = "condition",
  returnData = TRUE
)

percentVar <- round(
  100 * attr(pcaData, "percentVar")
)

pcaData$name <- rownames(pcaData)

library(ggplot2)

p <- ggplot(
  pcaData,
  aes(
    PC1,
    PC2,
    color = condition,
    label = name
  )
) +
  geom_point(size = 5) +
  geom_text(vjust = -1) +
  xlab(
    paste0(
      "PC1: ",
      percentVar[1],
      "% variance"
    )
  ) +
  ylab(
    paste0(
      "PC2: ",
      percentVar[2],
      "% variance"
    )
  ) +
  ggtitle("PCA of RNA-seq samples mapped to chr3") +
  theme_bw()

print(p)

ggsave(
  "/home/mila6004/Genomeanalysis/results/6_expression_analysis/deseq2/PCA_plot.png",
  plot = p,
  width = 8,
  height = 6,
  dpi = 300
)

# Spara normaliserade counts
normalized_counts <- counts(dataset, normalized=TRUE)

write.csv(
  as.data.frame(normalized_counts),
  file = "/home/mila6004/Genomeanalysis/results/6_expression_analysis/deseq2/normalized_counts.csv"
)
