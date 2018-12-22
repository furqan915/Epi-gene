#' Extract the representative Core Gene sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param organisms A number.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Number of core gene sequences in outputFiles present in pan-genome consisting of \code{organisms} included in this pan-genome study.
#' @examples
#' core_gen("clusters.fasta", 14, "coregen.fasta")
#' core_gen(inputFiles, 14, outputFile)
#' @export core_gen
core_gen <- function(inputFiles,
                     organisms, outputFiles) {system2("usearch.exe",
                                                      args=c("-sortbysize", input= inputFiles,
                                                             "-minsize", input=organisms,
                                                             "-fastaout", stdout=outputFiles))}
