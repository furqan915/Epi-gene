#' concatenate all the Gene/Genome sequences.
#'
#' @param V1 user defined name of previously clustered file with fasta format.
#' @param V2 user defined name of the output file.
#' @return Concatenating all the gene/genome sequences in the user defined directory.
#' @examples
#' for( i in 1:dim(genome.table)[1] ){
#'cat("Concatenating the sequences", genome.table$Files[i], "...\n")
#'in.file <- file.path("../sequence", genome.table$Files[i])
#'out.file <- file.path("../concatenateseq", genome.table$Files[i])
#'Concatenate(in.file,out.file)}
#' @export concatenate
#' @importFrom tidyr separate
#' @importFrom graphics barplot plot
#' @importFrom utils read.csv read.delim read.table write.csv write.table
concatenate <- function(V1,V2) {
  org1 <- read.table(V1, sep="\t")
  org1a <- separate(org1, V1, into = "new2", sep = "^(>.*)", remove = TRUE, convert = TRUE, extra = "warn", fill = "warn")
  org1b <- paste0(unlist(org1a), collapse= "")
  org1c <- as.data.frame(org1b)
  colnames(org1c) <- ">concatenated"
  write.table(org1c, file = V2, col.names = TRUE, row.names = FALSE, quote = FALSE)
  convert("txt", "fasta")
}
