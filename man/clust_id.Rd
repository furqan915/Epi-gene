% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clust_id.R
\name{clust_id}
\alias{clust_id}
\title{Clusters all the genome sequences and returns pan-matrix based on sequence identity percentage.}
\usage{
clust_id(inputFiles, id, outputFiles)
}
\arguments{
\item{inputFiles}{user defined name of previously clustered file with fasta format.}

\item{id}{A number ranging from 0.5 to 1.}

\item{outputFiles}{User defined name of the file with fasta extension}
}
\value{
Returns a binary pan-matrix file with csv extension e.g. ID_matrix.csv.
}
\description{
Clusters all the genome sequences and returns pan-matrix based on sequence identity percentage.
}
\examples{
clust_id("sorted.fasta", 0.5, "clusters.fasta")
}
