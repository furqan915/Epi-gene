#' Relabel the Gene/Genome sequences.
#'
#' @param inputFiles user defined name of previously clustered file with fasta format.
#' @param label A new number with organims id and gene e.g. org1|gene.
#' @param outputFiles User defined name of the file with fasta extension
#' @return Relabels gene/genome sequences in outputFiles.
#' @examples
#' relabel("organism.fasta", organism|geneno, "relabel.fasta")
#' for( i in 1:dim(genome.table)[1] ){
#'cat("Relabelling the fasta sequences", genome.table$Files[i], "...\n")
#'in.file <- file.path("../concatenate", genome.table$Files[i])
#'label <- file.path(genome.table$Strains[i])
#'out.file <- file.path("../relabel", genome.table$Files[i])
#'relabel(in.file,label,out.file)}
#' @export relabel
relabel <- function(inputFiles,label,
                    outputFiles) {system2("usearch.exe", args=c("-fastx_relabel",
                                                                input= inputFiles, "-prefix",
                                                                input=label, "-fastaout",
                                                                stdout=outputFiles))}
