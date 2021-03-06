% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adjmat.R
\name{make_adjmatrix}
\alias{make_adjmatrix}
\alias{make_adjmatrix_graph}
\title{Generate Adjacency Matrix}
\usage{
make_adjmatrix_graph(graph, directed = FALSE)
}
\arguments{
\item{graph}{An \code{\link[igraph]{igraph}} object. May be directed or weighted.}

\item{directed}{logical. Whether directed information is passed to the adjacency matrix.}
}
\value{
An adjacency matrix compatible with generating an expression matrix
}
\description{
Compute the adjacency matrix of a (directed) \code{\link[igraph]{igraph}} structure, preserving node/column/row names (and direction).
}
\examples{

library("igraph")
graph_test_edges <- rbind(c("A", "B"), c("B", "C"), c("B", "D"))
graph_test <- graph.edgelist(graph_test_edges, directed = TRUE)
adjacency_matrix <- make_adjmatrix_graph(graph_test)

}
\keyword{adjacency}
\keyword{graph}
\keyword{igraph}
\keyword{network}
