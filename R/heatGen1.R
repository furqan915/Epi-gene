#'Generate a Denrogram and heatmap based on the binary pan-matrix.
#'
#' @param file user defined name of previously clustered file with csv format e.g. bin_matrix.csv.
#' @return Returns a dendrogram and heatmap.
#' @examples
#' heatgen1("bin_matrix.csv")
#' @export heatgen1
#' @importFrom stats dist hclust heatmap
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
heatgen1 <- function(file) {
  gen <- read.csv(file, header = TRUE, sep = ",", check.names = FALSE)
  gen <- as.data.frame.matrix(gen)
  row.names(gen) <- gen$V1
  gen1 <- gen[ ,2:ncol(gen)]
  gen1 <- as.matrix(gen1)
  gen2 <- as.data.frame(t(gen1))
  dist_gen <- dist(gen2, method = "binary")
  dist_gen2  <- as.matrix(dist_gen)
  heatmap(dist_gen2, hclustfun = hclust)
}
