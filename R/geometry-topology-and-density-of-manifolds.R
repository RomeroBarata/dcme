#' Average Number of Points per Dimension (T2).
#'
#' \code{T2} computes the average number of points per dimension of the input
#' data set.
#'
#' @inheritParams F1
#' @return The average number of points per dimension of the input data set.
#' @export

T2 <- function(x){
  nrow(x) / ncol(x)
}
