% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/celda_CG.R
\name{celda_CG}
\alias{celda_CG}
\title{Cell and feature clustering with Celda}
\usage{
celda_CG(
  counts,
  sampleLabel = NULL,
  K,
  L,
  alpha = 1,
  beta = 1,
  delta = 1,
  gamma = 1,
  algorithm = c("EM", "Gibbs"),
  stopIter = 10,
  maxIter = 200,
  splitOnIter = 10,
  splitOnLast = TRUE,
  seed = 12345,
  nchains = 3,
  zInitialize = c("split", "random", "predefined"),
  yInitialize = c("split", "random", "predefined"),
  countChecksum = NULL,
  zInit = NULL,
  yInit = NULL,
  logfile = NULL,
  verbose = TRUE
)
}
\arguments{
\item{counts}{Integer matrix. Rows represent features and columns represent
cells.}

\item{sampleLabel}{Vector or factor. Denotes the sample label for each cell
(column) in the count matrix.}

\item{K}{Integer. Number of cell populations.}

\item{L}{Integer. Number of feature modules.}

\item{alpha}{Numeric. Concentration parameter for Theta. Adds a pseudocount
to each cell population in each sample. Default 1.}

\item{beta}{Numeric. Concentration parameter for Phi. Adds a pseudocount to
each feature module in each cell population. Default 1.}

\item{delta}{Numeric. Concentration parameter for Psi. Adds a pseudocount to
each feature in each module. Default 1.}

\item{gamma}{Numeric. Concentration parameter for Eta. Adds a pseudocount to
the number of features in each module. Default 1.}

\item{algorithm}{String. Algorithm to use for clustering cell subpopulations.
One of 'EM' or 'Gibbs'. The EM algorithm for cell clustering is faster,
especially for larger numbers of cells. However, more chains may be required
to ensure a good solution is found. Default 'EM'.}

\item{stopIter}{Integer. Number of iterations without improvement in the log
likelihood to stop inference. Default 10.}

\item{maxIter}{Integer. Maximum number of iterations of Gibbs sampling to
perform. Default 200.}

\item{splitOnIter}{Integer. On every `splitOnIter` iteration, a heuristic
will be applied to determine if a cell population or feature module should
be reassigned and another cell population or feature module should be split
into two clusters. To disable splitting, set to -1. Default 10.}

\item{splitOnLast}{Integer. After `stopIter` iterations have been
performed without improvement, a heuristic will be applied to determine if
a cell population or feature module should be reassigned and another cell
population or feature module should be split into two clusters. If a split
occurs, then 'stopIter' will be reset. Default TRUE.}

\item{seed}{Integer. Passed to \link[withr]{with_seed}. For reproducibility,
a default value of 12345 is used. If NULL, no calls to
\link[withr]{with_seed} are made.}

\item{nchains}{Integer. Number of random cluster initializations. Default 3.}

\item{zInitialize}{Chararacter. One of 'random', 'split', or 'predefined'.
With 'random', cells are randomly assigned to a populations. With 'split',
cells will be split into sqrt(K) populations and then each popluation will
be subsequently split into another sqrt(K) populations. With 'predefined',
values in `zInit` will be used to initialize `z`. Default 'split'.}

\item{yInitialize}{Chararacter. One of 'random', 'split', or 'predefined'.
With 'random', features are randomly assigned to a modules. With 'split',
features will be split into sqrt(L) modules and then each module will be
subsequently split into another sqrt(L) modules. With 'predefined', values
in `yInit` will be used to initialize `y`. Default 'split'.}

\item{countChecksum}{Character. An MD5 checksum for the `counts` matrix.
Default NULL.}

\item{zInit}{Integer vector. Sets initial starting values of z. If NULL,
starting values for each cell will be randomly sampled from 1:K. 'zInit'
can only be used when `initialize' = 'random'`. Default NULL.}

\item{yInit}{Integer vector. Sets initial starting values of y. If NULL,
starting values for each feature will be randomly sampled from 1:L.
'yInit' can only be used when `initialize = 'random'`. Default NULL.}

\item{logfile}{Character. Messages will be redirected to a file named
`logfile`. If NULL, messages will be printed to stdout.  Default NULL.}

\item{verbose}{Logical. Whether to print log messages. Default TRUE.}
}
\value{
An object of class `celda_CG` with the cell populations clusters
 stored in `z` and feature module clusters stored in `y`.
}
\description{
Clusters the rows and columns of a count matrix containing
 single-cell data into L modules and K subpopulations, respectively.
}
\examples{
data(celdaCGSim)
celdaMod <- celda_CG(celdaCGSim$counts,
  K = celdaCGSim$K,
  L = celdaCGSim$L,
  sampleLabel = celdaCGSim$sampleLabel,
  nchains = 1
)
}
\seealso{
`celda_G()` for feature clustering and `celda_C()` for clustering
 cells. `celdaGridSearch()` can be used to run multiple values of K/L and
 multiple chains in parallel.
}
