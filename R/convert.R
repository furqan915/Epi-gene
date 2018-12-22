#' Convert all the fasta formatted Gene/Genome sequences to txt formats.
#'
#' @param old all the files in the directory with fasta/txt format.
#' @param new all the files in the directory with fasta/txt format.
#' @return convert all the gene/genome sequences in the user defined directory to txt/fasta.
#' Need to set the working directory everytime.
#' @examples
#' convert("txt", "fasta")
#' convert("fasta", "txt")
#' @export convert
convert <- function(old, new) {
  oldformat <- as.character(paste0(" *",".", old))
  newformat <- as.character(paste0(" *",".", new))
  shell(paste0("ren",oldformat,newformat))
}
