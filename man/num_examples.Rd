% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simple-measures.R
\name{num_examples}
\alias{num_examples}
\title{The Number of Observations in the Data Set.}
\usage{
num_examples(x)
}
\arguments{
\item{x}{A data frame, or an object that can be converted to a data frame,
containing only the features of the data.}
}
\value{
The number of examples present in the input data set.
}
\description{
\code{num_examples} computes the number of examples present in the input
data set. It is just a wrapper for the \code{nrow} function.
}
