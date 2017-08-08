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

#' The Number of Observations in the Majority Class.
#'
#' \code{num_examples_majority} computes the number of examples in the
#' majority class. It assumes the number of classes in the input data set is
#' two.
#'
#' @inheritParams F1
#' @return The number of examples in the majority class.
#' @export

num_examples_majority <- function(x, y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  max(table(y))
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

#' The Imbalance Ratio (IR) of a Data Set.
#'
#' \code{IR} computes the imbalance ratio of a binary data set. It is defined
#' as the ratio of the number of majority class examples to the number of
#' minority class examples.
#'
#' @inheritParams F1
#' @return The imbalance ratio of the input data set.
#' @export

IR <- function(y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  y_contingency_table <- table(y)
  max(y_contingency_table) / min(y_contingency_table)
}
