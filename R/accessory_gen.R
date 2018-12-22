#' Extract the representative Accessory Gene sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param organisms A number.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Number of accessory gene sequences in outputFiles present in pan-genome consisting of \code{organisms} included in this pan-genome study.
#' @examples
#' accessory_gen("clusters.fasta", 14, "access.fasta")
#' accessory_gen(inputFiles, 14, outputFile)
#' @export accessory_gen

accessory_gen <- function(inputFiles,organisms, outputFiles) {system2("usearch.exe", args=c("-sortbysize", input= inputFiles,"-maxsize", input=c(organisms-1),"-minsize 2", "-fastaout", stdout=outputFiles))}






