% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/core_gen.R
\name{core_gen}
\alias{core_gen}
\title{Extract the representative Core Gene sequences.}
\usage{
core_gen(inputFiles, organisms, outputFiles)
}
\arguments{
\item{inputFiles}{user defined name of previously clustered file with fasta format.}

\item{organisms}{A number.}

\item{outputFiles}{User defined name of the file with fasta extension}
}
\value{
Number of core gene sequences in outputFiles present in pan-genome consisting of \code{organisms} included in this pan-genome study.
}
\description{
Extract the representative Core Gene sequences.
}
\examples{
core_gen("clusters.fasta", 14, "coregen.fasta")
core_gen(inputFiles, 14, outputFile)
}
