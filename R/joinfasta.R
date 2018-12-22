#' Join all the fasta formatted Gene/Genome sequences in the working directory.
#'
#' @param allfasta write all fasta to join the all fasta sequences present in the directory.
#'
#' @return join all the gene/genome sequences in the user defined directory and returns combined.fasta.
#' Need to set the working directory everytime.
#' @examples
#' convert("txt", "fasta")
#' convert("fasta", "txt")
#' @export convert
joinfasta <- function(allfasta) {
  allfasta <- ("*.fasta")
  joined <- shell(paste("copy", allfasta, "combined.fasta"))
}
