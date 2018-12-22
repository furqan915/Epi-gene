#' Returns the Number of Accessory Gene sequences.
#'
#' @param file user defined name of previously binary clustered file with csv format.
#' @return Number of accessory gene sequences in outputFiles present in pan-genome included in this pan-genome study.
#' @examples
#' accessorygenes("bin_matrix.csv")
#' @export accessorygenes
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table

accessorygenes <- function(file) {
  y <- read.csv(file)
  rownames(y) <- y$X
  bin3 <- y[ ,2: ncol(y)]
  bin4 <-as.data.frame(rowSums(bin3))
  colnames(bin4) <- "TotalGenes"
  bin5 <- cbind.data.frame(bin3,bin4)
  bin6 <- subset(bin5, TotalGenes >=2 & TotalGenes <= (ncol(bin3)-1))
  bin6$Totals <-NULL
  access <- data.frame(nrow(bin6))
  colnames(access) <- as.character("AccessoryGenes")
  print(access)
  bin7 <- as.data.frame(colSums(bin6))
  range <- range(bin7)
  colnames(bin7) <- "Accessory Genes"
  bin8 <- data.frame(Organism = row.names(bin7), bin7)
  row.names(bin8) <- NULL
  access <- write.csv(bin8, "access_genes.csv")
  print(bin8)
  print(range)
  barplot(bin8$Accessory.Genes, main="Accessory genes", names.arg= bin8$Organism)
}
