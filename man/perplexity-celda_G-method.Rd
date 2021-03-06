% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/celda_G.R
\name{perplexity,celda_G-method}
\alias{perplexity,celda_G-method}
\title{Calculate the perplexity on new data with a celda_G model}
\usage{
\S4method{perplexity}{celda_G}(counts, celdaMod, newCounts = NULL)
}
\arguments{
\item{counts}{Integer matrix. Rows represent features and columns represent
cells. This matrix should be the same as the one used to generate
`celdaMod`.}

\item{celdaMod}{Celda object of class "celda_C"}

\item{newCounts}{A new counts matrix used to calculate perplexity. If NULL,
perplexity will be calculated for the 'counts' matrix. Default NULL.}
}
\value{
Numeric. The perplexity for the provided count data and model.
}
\description{
Perplexity is a statistical measure of how well a probability
 model can predict new data. Lower perplexity indicates a better model.
}
\examples{
data(celdaGSim, celdaGMod)
perplexity <- perplexity(celdaGSim$counts, celdaGMod)
}
\seealso{
`celda_G()` for clustering features
}
