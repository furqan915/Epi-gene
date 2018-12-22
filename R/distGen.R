#'Generate a distance matrix table based on the binary pan-matrix.
#'
#' @param file user defined name of previously clustered file with csv format e.g. bin_matrix.csv.
#' @return Returns a binary pan-matrix file with csv extension e.g. ID_matrix.csv.
#' @examples
#' distGen("bin_matrix.csv")
#' @export distGen
#' @importFrom stats dist hclust heatmap
#' @importFrom graphics plot
#' @importFrom utils read.csv write.table
distGen <- function(file) {
  gen <- read.csv(file, header = TRUE, sep = ",", check.names = FALSE)
  gen <- as.data.frame.matrix(gen)
  row.names(gen) <- gen$V1
  gen1 <- gen[ ,2:ncol(gen)]
  gen1 <- as.matrix(gen1)
  gen2 <- as.data.frame(t(gen1))
  dist_gen <- dist(gen2, method = "binary")
  dist_gen2  <- as.matrix(dist_gen)
  distances <- write.table(dist_gen2, "distances.txt")
  plot(hclust(dist_gen, method = "average"))
}
