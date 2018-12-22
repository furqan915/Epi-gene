# Epi-gene
Epi Gene can cluster the whole genomes into 3 categories of core, 
    accessory and unique genes. It can build two types of panmatrixes (i) 
    Binary Panmatrix based on absence and presence of genes. (ii) Panmatrix 
    based on the identity of the sequences. Binary pan-matrix will be used 
    to build a UPMGA tree and heatmap to further describe an evolutionary relationship. 
    While the pan-matrix based on sequence identity can be used for further
    quantitative analyses. This software can only work in WINDOWS operating systems.
    
                   Install from GitHub :  devtools::install_github("furqan915/Epi-Gene")
For a step by step guide, you can go through the vignettes, case study and this read me file:


# Getting started

getwd()

setwd("E:/test")

library(EpiGene)

## Prepare and load the meta-data file
genome.table <- read.table("E:/test/Genome.txt", sep="\t", header=TRUE)

genome.table
## Predict the ORF
for( i in 1:dim(genome.table)[1] ){

  cat("Relabelling the fasta sequences", genome.table$Files[i], "...\n")
  
  in.file <- file.path("E:/test/genomes", genome.table$Files[i])
  
  out.file <- file.path("E:/test/predicted", genome.table$Files[i])
  
  predORFaa(in.file, out.file)}

## Relabel the genome sequences
for( i in 1:dim(genome.table)[1] ){

  cat("Relabelling the fasta sequences", genome.table$Files[i], "...\n")
  
  in.file <- file.path("E:/test/genomes", genome.table$Files[i])
  
  label <- file.path(genome.table$Relabel_ID[i])
  
  out.file <- file.path("E:/test/relabel", genome.table$Files[i])
  
  relabel(in.file,label,out.file)}

## Join the relabelled genome sequences
setwd("E:/test/relabel")

joinfasta(allfasta)

## Sorting by Length
Need to copy that combined.fasta file into the same very folder that have usearch.exe

sortbylength("combined.fasta", "sorted.fasta")

## Clustering that returns the Binary Matrix
clust_bin("sorted.fasta", 0.5, "clusterd.fasta", 14)
## Enumerating the genes in their related categories
panGen("bin_matrix.csv")

coregenes("bin_matrix.csv")

accessorygenes("bin_matrix.csv")

Uniqgenes("bin_matrix.csv")
## Representative gene cluster sequences
core_gen("clusterd.fasta", 14, "coregen.fasta")

accessory_gen("clusterd.fasta", 14, "accessory.fasta")

uniq_gen("clusterd.fasta", 1, "uniq.fasta")
## Phylogenetic Analyses
### Dendrogram generation and clustered distances
distGen("bin_matrix.csv")
### Heat Map chart based on the clustered distances
heatgen1("bin_matrix.csv")
### Heat Map chart based on the presence/absence of genes
heatgen2("bin_matrix.csv")

This function needs heavy computation. Therefore high number of genomes requires a powerfull computer to generate this heat map.

## Clustering on the basis of sequence Identity percentage
clust_id("sorted.fasta", 0.5, "clusterd_id.fasta")

Identity matrix generated after this clustering can be utilized for further quantitative analyses e.g. Prinicpal component Analyses.
