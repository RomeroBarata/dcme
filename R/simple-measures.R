#' The Number of Observations in the Data Set.
#'
#' \code{num_examples} computes the number of examples present in the input
#' data set. It is just a wrapper for the \code{nrow} function.
#'
#' @inheritParams F1
#' @return The number of examples present in the input data set.
#' @export

num_examples <- function(x){
  nrow(x)
}

#' The Number of Features in the Data Set.
#'
#' \code{num_features} computes the number of features present in the input
#' data set. It is just a wrapper for the \code{ncol} function.
#'
#' @inheritParams F1
#' @return The number of features present in the input data set.
#' @export

num_features <- function(x){
  ncol(x)
}

#' The Number of Classes in the Data Set.
#'
#' \code{num_classes} computes the number of classes present in the input
#' data set.
#'
#' @inheritParams F1
#' @return The number of classes present in the input data set.
#' @export

num_classes <- function(y){
  length(unique(y))
}
