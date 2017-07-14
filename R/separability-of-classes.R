#' Ratio of Average Intra/Inter Class NN Distance.
#'
#' \code{N2} computes the average intra-class and average inter-class distance
#' of the 1-NN, and returns the intra/inter ratio.
#'
#' @inheritParams F1
#' @return The ratio between the average intra-class and average inter-class
#'  1-NN Euclidian distance.
#' @export

N2 <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)
  if (!is.factor(y)) y <- as.factor(y)

  data <- cbind(x, class = y)
  data_1nn <- kknn::kknn(class ~ .,
                         train = data,
                         test = data,
                         k = 2,  # First neighbour is the example itself
                         distance = 2,  # Euclidian
                         kernel = "rectangular"  # Unweighted knn
                        )
  data_1nn_class <- data_1nn$CL[, -1, drop = TRUE]
  data_1nn_dist <- data_1nn$D[, -1, drop = TRUE]
  inter_intra_dists <- vapply(split(data_1nn_dist, y == data_1nn_class),
                              mean,
                              numeric(1))
  # "TRUE" == intra, "FALSE" == inter
  inter_intra_dists[["TRUE"]] / inter_intra_dists[["FALSE"]]
}

#' Error Rate of 1NN Classifier.
#'
#' \code{N3} computes the error rate of the 1NN classifier using the
#' leave-one-out strategy.
#'
#' @inheritParams F1
#' @return The leave-one-out error estimate of the 1NN classifier for the
#'  input data set.
#' @export

N3 <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)
  if (!is.factor(y)) y <- as.factor(y)

  data <- cbind(x, class = y)
  data_1nn <- kknn::kknn(class ~ .,
                         train = data,
                         test = data,
                         k = 2,  # First neighbour is the examples itself
                         distance = 2,  # Euclidian
                         kernel = "rectangular"  # Unweighted knn
                        )$CL[, -1, drop = TRUE]
  mean(data_1nn != y)
}
