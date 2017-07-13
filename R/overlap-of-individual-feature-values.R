#' Fisher's Discriminant Ratio (F1).
#'
#' \code{F1} computes the Fisher's Discriminant Ratio of a binary data set.
#'
#' @param x A data frame, or an object that can be converted to a data frame,
#'  containing (only) the features of the data.
#' @param y A vector (or factor) determining the class of each example in
#'  the data.
#' @return The Fisher's Discriminant Ratio of a binary data set.
#' @export

F1 <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  x_groups <- split(x, y)
  if (length(x_groups) != 2) stop("Data must have (only) 2 classes.")

  means_and_sds <- vector("list", length = length(x_groups))
  for (i in seq_along(x_groups)){
    means_and_sds[[i]] <- vapply(x_groups[[i]],
                                 function(x) c(mean = mean(x, na.rm = TRUE),
                                               sd = sd(x, na.rm = TRUE)),
                                 numeric(2))
  }

  a <- (means_and_sds[[1]]["mean", ] - means_and_sds[[2]]["mean", ]) ^ 2
  b <- means_and_sds[[1]]["sd", ] ^ 2 + means_and_sds[[2]]["sd", ] ^ 2
  max(a / b)
}

#' Volume of Overlap Region (F2).
#'
#' \code{F2} computes the Volume of Overlap Region of a binary data set.
#'
#' @inheritParams F1
#' @return The Volume of Overlap Region of a binary data set.
#' @export

F2 <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  x_groups <- split(x, y)
  if (length(x_groups) != 2) stop("Data must have (only) 2 classes.")

  maxs_and_mins <- vector("list", length = length(x_groups))
  for (i in seq_along(x_groups)){
    maxs_and_mins[[i]] <- vapply(x_groups[[i]],
                                 function(x) c(max = max(x, na.rm = TRUE),
                                               min = min(x, na.rm = TRUE)),
                                 numeric(2))
  }

  num_features <- ncol(x)
  f2 <- vector("numeric", length = num_features)
  for (i in seq_len(num_features)){
    a <- min(maxs_and_mins[[1]]["max", i], maxs_and_mins[[2]]["max", i]) -
      max(maxs_and_mins[[1]]["min", i], maxs_and_mins[[2]]["min", i])
    b <- max(maxs_and_mins[[1]]["max", i], maxs_and_mins[[2]]["max", i]) -
      min(maxs_and_mins[[1]]["min", i], maxs_and_mins[[2]]["min", i])
    f2[i] <- a / b
  }

  prod(f2)
}
