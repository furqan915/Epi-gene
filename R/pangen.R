#' Enumerates the Gene sequences present in all the genomes.
#'
#' @param file user defined name of previously clustered file with fasta format.
#' @return enumerates all the gene sequences in outputFiles present in pan-genome.
#' @examples
#' panGen("bin_matrix.csv")
#' @export panGen
#' @importFrom stats dist hclust heatmap
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
panGen <- function(file) {
  y <- read.csv(file)
  bin3 <- y[ ,2: ncol(y)]
  bin4 <-as.data.frame(colSums(bin3))
  colnames(bin4) <- "TotalGenes"
  median <- median(bin4$TotalGenes)
  pangeno <- colSums(bin4)
  bin5 <- data.frame(Organism = row.names(bin4), bin4)
  row.names(bin5) <- NULL
  pangeno2 <- write.csv(bin5, "Pangenome.csv")
  print(bin5)
  print(pangeno)
  print(median)
  barplot(bin5$TotalGenes, main="Pan genome", names.arg= bin5$Organism)
}
