#' Returns the Number of Core Gene sequences.
#'
#' @param file user defined name of previously binary clustered file with csv format.
#' @return Number of core gene sequences in outputFiles present in pan-genome included in this pan-genome study.
#' @examples
#' coregenes("bin_matrix.csv")
#' @export coregenes
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
coregenes <- function(file) {
  y <- read.csv(file)
  rownames(y) <- y$X
  bin3 <- y[ ,2: ncol(y)]
  bin4 <-as.data.frame(rowSums(bin3))
  colnames(bin4) <- "TotalGenes"
  bin5 <- cbind.data.frame(bin3,bin4)
  bin6 <- subset(bin5, TotalGenes >= ncol(bin3))
  bin6$Totals <-NULL
  bin7 <- as.data.frame(colSums(bin6))
  colnames(bin7) <- "Core Genes"
  print(bin7)
}
