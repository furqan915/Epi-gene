#' Returns the Number of Unique Gene sequences.
#'
#' @param file user defined name of previously binary clustered file with csv format.
#' @return Number of accessory gene sequences in outputFiles present in pan-genome included in this pan-genome study.
#' @examples
#' Uniqgenes(file)
#' @export Uniqgenes
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table

Uniqgenes <- function(file) {
  y <- read.csv(file)
  bin3 <- y[ ,2: ncol(y)]
  bin4 <-as.data.frame(rowSums(bin3))
  colnames(bin4) <- "TotalGenes"
  bin5 <- cbind.data.frame(bin3,bin4)
  bin6 <- subset(bin5, TotalGenes <=1)
  bin6$Totals <-NULL
  bin7 <- as.data.frame(colSums(bin6))
  colnames(bin7) <- "Unique Genes"
  bin8 <- data.frame(Organism = row.names(bin7), bin7)
  row.names(bin8) <- NULL
  print(bin8)
  barplot(bin8$Unique.Genes, main="Unique Genes", names.arg= bin8$Organism)
}
