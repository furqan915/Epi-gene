#' Predicts and writes the amino acid sequences of ORF in Genome sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Predicts the Amino acid sequences in outputFiles present in pan-genome.
#' @examples
#' predORFaa("anyseq.fasta", "AA.fasta")
#' @export predORFaa

predORFaa <- function(inputFiles, outputFiles){
  system2("prodigal.exe", args=c("-i",input= inputFiles,
                                 "-o other.fasta","-a", stdout=outputFiles, "-q"),
          invisible = TRUE, wait = TRUE)
  file.remove("other.fasta")
}
