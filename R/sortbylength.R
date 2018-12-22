#' Sort the Gene/Genome sequences by length (A necessary step before clustering).
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Sorts the gene/genome sequences by length in outputFiles.
#' @examples
#' Sortbylength("combined.fasta", "sorted.fasta")
#' @export sortbylength

sortbylength <- function(inputFiles,
                         outputFiles) {system2("usearch.exe", args=c("-sortbylength",
                                                                     input= inputFiles, "-fastaout",
                                                                     stdout=outputFiles))}
