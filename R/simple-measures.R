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

num_examples_majority <- function(y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  max(table(y))
}

#' The Number of Observations in the Minority Class.
#'
#' \code{num_examples_minority} computes the number of examples in the
#' minority class. It assumes the number of classes in the input data set is
#' two.
#'
#' @inheritParams F1
#' @return The number of examples in the minority class.
#' @export

num_examples_minority <- function(y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  min(table(y))
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

#' The Number of Numeric Features in the Data Set.
#'
#' \code{num_features_numeric} computes the number of numeric features
#' present in the input data set.
#'
#' @inheritParams F1
#' @return The number of numeric features present in the input data set.
#' @export

num_features_numeric <- function(x){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  sum(vapply(x, is.numeric, logical(1)))
}

#' The Number of Binary Features in the Data Set.
#'
#' \code{num_features_binary} computes the number of binary features present
#' in the input data set. NA values are ignored.
#'
#' @inheritParams F1
#' @return The number of binary features present in the input data set.
#' @export

num_features_binary <- function(x){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  is_binary <- function(x){
    length(unique(x[!is.na(x)])) == 2
  }

  sum(vapply(x, is_binary, logical(1)))
}

#' The Number of Categorical Feautures in the Data Set.
#'
#' \code{num_features_categorical} computes the number of categorical
#' features present in the input data set.
#'
#' @inheritParams F1
#' @return The number of categorical features present in the input data set.
#' @export

num_features_categorical <- function(x){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  sum(vapply(x, is.character, logical(1)))
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

#' The Proportion of Majority Examples in the Data Set.
#'
#' \code{proportion_examples_majority} computes the proportion of examples
#' that belong to the majority class.
#'
#' @inheritParams F1
#' @return The proportion of examples that belong to the majority class.
#' @export

proportion_examples_majority <- function(y){
  num_examples_majority(y) / length(y)
}

#' The Proportion of Minority Examples in the Data Set.
#'
#' \code{proportion_examples_minority} computes the proportion of examples
#' that belong to the minority class.
#'
#' @inheritParams F1
#' @return The proportion of examples that belong to the minority class.
#' @export

proportion_examples_minority <- function(y){
  num_examples_minority(y) / length(y)
}

#' The Proportion of Numeric Features in the Data Set.
#'
#' \code{proportion_features_numeric} computes the proportion of features
#' that are numeric.
#'
#' @inheritParams F1
#' @return The proportion of features that are numeric in the input data set.
#' @export

proportion_features_numeric <- function(x){
  num_features_numeric(x) / num_features(x)
}

#' The Proportion of Binary Features in the Data Set.
#'
#' \code{proportion_features_binary} computes the proportion of features that
#' are binary.
#'
#' @inheritParams F1
#' @return The proportion of features that are binary in the input data set.
#' @export

proportion_features_binary <- function(x){
  num_features_binary(x) / num_features(x)
}

#' The Proportion of Categorical Features in the Data Set.
#'
#' \code{proportion_features_categorical} computes the proportion of features
#' that are categorical.
#'
#' @inheritParams F1
#' @return The proportion of features that are categorical in the input data
#'  set.
#' @export

proportion_features_categorical <- function(x){
  num_features_categorical(x) / num_features(x)
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
  num_examples_majority(y) / num_examples_minority(y)
}
