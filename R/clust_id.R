#' Clusters all the genome sequences and returns pan-matrix based on sequence identity percentage.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param id A number ranging from 0.5 to 1.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Returns a binary pan-matrix file with csv extension e.g. ID_matrix.csv.
#' @examples
#' clust_id("sorted.fasta", 0.5, "clusters.fasta")
#' @export clust_id
#' @importFrom reshape2 dcast
#' @importFrom dplyr distinct
#' @importFrom tidyr separate
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
clust_id <- function(inputFiles,id,outputFiles) {
  system2("usearch.exe", args=c("-cluster_smallmem", input= inputFiles,"-id",input=id, "-sizeout", "-centroids", stdout=outputFiles, "-uc", stdout="allclusters.txt"))
  clust <- read.delim("allclusters.txt",header = FALSE, sep = "\t")
  input <- subset(clust, V1 %in% c("S","H"), select = c("V2", "V9", "V4"))
  input[, 4] <- gsub('^org(.+)\\|.*', '\\1', input[, 2])
  input2 <- subset(input, select = c("V2", "V4.1", "V4"))
  input3 <- as.data.frame(sub("*", "100.0", input2$V4, fixed = TRUE))
  colnames(input3) <- "Ident_Perc"
  input4 <- cbind(input2, input3)
  input5 <- input4[ ,-3]
  colnames(input5) <- c("clustered", "Orgs", "Percent_ID")
  input6 <- distinct(input5, clustered, Orgs, .keep_all = TRUE)
  input7 <- dcast(input6, clustered ~ Orgs, value.var = "Percent_ID", fun.aggregate = NULL)
  input7[is.na(input7)] <- 0
  input7
  write.csv(input7, "ID_matrix.csv")
  return(input7)
}
