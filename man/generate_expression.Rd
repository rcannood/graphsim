% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate.R
\name{generate_expression}
\alias{generate_expression}
\alias{generate_expression_mat}
\title{Generate Simulated Expression}
\usage{
generate_expression(
  n,
  graph,
  state = NULL,
  cor = 0.8,
  mean = 0,
  comm = FALSE,
  dist = FALSE,
  absolute = FALSE,
  laplacian = FALSE
)

generate_expression_mat(
  n,
  mat,
  state = NULL,
  cor = 0.8,
  mean = 0,
  comm = FALSE,
  dist = FALSE,
  absolute = FALSE,
  laplacian = FALSE
)
}
\arguments{
\item{n}{number of observations (simulated samples).}

\item{graph}{An \code{\link[igraph]{igraph}} object. May must be directed if states are used.}

\item{state}{numeric vector. Vector of length E(graph). Sign used to calculate state matrix, may be an integer state or inferred directly from expected correlations for each edge. May be applied a scalar across all edges or as a vector for each edge respectively. May also be entered as text for "activating" or "inhibiting" or as integers for activating (0,1) or inhibiting (-1,2). Compatible with inputs for \code{\link[graphsim]{plot_directed}}. Also takes a pre-computed state matrix from \code{\link[graphsim]{make_state_matrix}} if applied to the same graph multiple times.}

\item{cor}{numeric. Simulated maximum correlation/covariance of two adjacent nodes. Default to 0.8.}

\item{mean}{mean value of each simulated gene. Defaults to 0. May be entered as a scalar applying to all genes or a vector with a separate value for each.}

\item{comm, absolute, laplacian}{logical. Parameters for Sigma matrix generation. Passed on to \code{\link[graphsim]{make_sigma_mat_dist_graph}} or \code{\link[graphsim]{make_sigma_mat_graph}}.}

\item{dist}{logical. Whether a graph distance (\code{\link[graphsim]{make_sigma_mat_dist_graph}}) or derived matrix (\code{\link[graphsim]{make_sigma_mat_graph}}) is used to compute the sigma matrix.}

\item{mat}{precomputed adjacency, laplacian, commonlink, or scaled distance matrix.}
}
\value{
numeric matrix of simulated data (log-normalised counts)
}
\description{
Compute simulated continuous expression data from a graph network structure. Requires an \code{\link[igraph]{igraph}} pathway structure and a matrix of states (1 for activating and -1 for inhibiting) for link signed correlations, from a vector of edge states to a signed adjacency matrix for use in \code{\link[graphsim]{generate_expression}}. Uses graph structure to pass a sigma covariance matrix from \code{\link[graphsim]{make_sigma_mat_dist_graph}} or \code{\link[graphsim]{make_sigma_mat_graph}} on to \code{\link[mvtnorm]{rmvnorm}}.
}
\examples{

library("igraph")
graph_test_edges <- rbind(c("A", "B"), c("B", "C"), c("B", "D"))
graph_test <- graph.edgelist(graph_test_edges, directed = TRUE)
n <- 100
generate_expression(n, graph_test, cor = 0.8)

adjacency_matrix <- make_adjmatrix_graph(graph_test)
generate_expression_mat(n, adjacency_matrix, cor = 0.8)

}
\keyword{graph}
\keyword{igraph}
\keyword{mvtnorm}
\keyword{network}
\keyword{simulation}
