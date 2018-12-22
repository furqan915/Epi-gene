#'Generate heatmap based on presence/absence of gene.
#'
#' @param file user defined name of previously clustered file with csv format e.g. bin_matrix.csv.
#' @return Returns a heatmap based on presence/absence of gene.
#' @examples
#' heatgen2("bin_matrix.csv")
#' @export heatgen2
#' @importFrom stats dist hclust heatmap
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
heatgen2 <- function(file) {
  gen <- read.csv(file, header = TRUE, sep = ",", check.names = FALSE)
  gen <- as.data.frame.matrix(gen)
  row.names(gen) <- gen$V1
  gen1 <- gen[ ,2:ncol(gen)]
  gen1 <- as.matrix(gen1)
  gen2 <- as.matrix.data.frame(t(gen1))
  heatmap(gen2, hclustfun = hclust,
          scale = c("row", "column", "none"), margins = c(5, 5), labCol = FALSE)
}
