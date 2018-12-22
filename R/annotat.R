#' Locally aligned the entered sequences with any given database.
#'
#' @param inputFiles user defined name of sequences intended to be aligned with fasta format.
#' @param database user defined name of database with fasta format.
#' @param evalue A number e.g. 1E-6, 0.0 etc.
#' @param id A number ranging from 0.3 to 1.
#' @param outputFiles User defined name of the file with txt extension
#' @return Locally aligned sequences with their annotations and other particulars in outputFiles.
#' @examples
#' annotate("sequences.fasta", "keggdatabase.fasta", 1E-6, 0.4 ,"kegg.txt")
#' @export annotat

annotat <- function(inputFiles,database,evalue,
                    id, outputFiles) {system2("usearch.exe",
                                              args=c("-ublast", input= inputFiles, "-db",
                                                     input=database, "-evalue", input= evalue, "-id", input= id,
                                                     "-top_hit_only, -userout", stdout=outputFiles,
                                                     "-userfields query+target+evalue+id+tcov+tseq+qseq"))}

