#' Clusters all the genome sequences and returns binary pan-matrix.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param id A number ranging from 0.5 to 1.
#' @param outputFiles User defined name of the file with fasta extension
#' @param y total number of organisms included for pan-genomic study.
#' @return Returns a binary pan-matrix file with csv extension e.g. bin_matrix.csv.
#' @examples
#' clust_bin("sorted.fasta", 0.5, "clusters.fasta", 14)
#' @export clust_bin
clust_bin <- function(inputFiles,id,outputFiles,y) {system2("usearch.exe", args=c("-cluster_smallmem", input= inputFiles,"-id",input=id, "-sizeout", "-centroids", stdout=outputFiles, "-uc", stdout="allclusters.txt"))
  clust <- read.delim("allclusters.txt",header = FALSE, sep = "\t")
  input <- subset(clust, V1 %in% c("S","H"), select = c("V2", "V9"))
  input[, 3] <- gsub('^org(.+)\\|.*', '\\1', input[, 2])
  possibleOrgs <- seq_len(pmax(input[, 3])) # = c(1, 2, 3, 4)
  pan.matrix <- vapply(unique(input[, 1]), function (x) possibleOrgs %in% input[input[, 1] == x, 3], logical(y))
  pan.matrix <- t(pan.matrix) * 1
  colnames (pan.matrix) <- paste0('org', possibleOrgs)
  rownames(pan.matrix) <- unique(input[, 1])
  bin_matrix <- write.csv(pan.matrix, "bin_matrix.csv")
  return(bin_matrix <- as.data.frame.matrix(pan.matrix))
}
