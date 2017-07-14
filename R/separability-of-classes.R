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
