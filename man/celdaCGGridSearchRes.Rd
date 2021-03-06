% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{celdaCGGridSearchRes}
\alias{celdaCGGridSearchRes}
\title{celdaCGGridSearchRes}
\format{
An object as returned from celdaGridSearch()
}
\usage{
celdaCGGridSearchRes
}
\description{
Example results of celdaGridSearch on celdaCGSim
}
\examples{
data(celdaCGSim)
celdaCGGridSearchRes <- celdaGridSearch(celdaCGSim$counts,
  model = "celda_CG",
  paramsTest = list(K = seq(4, 6), L = seq(9, 11)),
  paramsFixed = list(sampleLabel = celdaCGSim$sampleLabel),
  bestOnly = TRUE,
  nchains = 1,
  cores = 2
)
}
\keyword{datasets}
