#' Predicts and writes the nucleotide sequences of ORF in Genome sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Predicts the nucleotide ORF sequences in outputFiles.
#' @examples
#' predORFnuc("anyseq.fasta", "NUC.fasta")
#' @export predORFnuc
predORFnuc <- function(inputFiles, outputFiles){
  system2("prodigal.exe", args=c("-i",input= inputFiles,
                                 "-o other.fasta","-d", stdout=outputFiles, "-q"),
          invisible = TRUE, wait = TRUE)
  file.remove("other.fasta")
}

