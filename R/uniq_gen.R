#' Extract the representative Unique Gene sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param uniq Least number of organisms e.g. 1.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Number of unique gene sequences in outputFiles present in pan-genome consisting of \code{organisms} included in this pan-genome study.
#' @examples
#' uniq_gen("clusters.fasta", 1, "uniq.fasta")
#' uniq_gen(inputFiles, 1, outputFile)
#' @export uniq_gen
uniq_gen <- function(inputFiles,uniq, outputFiles) {system2("usearch.exe",
                                                            args=c("-sortbysize",
                                                                   input= inputFiles,
                                                                   "-maxsize", input=uniq,
                                                                   "-fastaout", stdout=outputFiles))}
