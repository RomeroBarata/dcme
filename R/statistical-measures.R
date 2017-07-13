#' The Geometric Mean Ratio of Standard Deviations.
#'
#' \code{sd_ratio} computes the lack of homogeneity between the covariance
#' matrices of the classes in the data set.
#'
#' @inheritParams F1
#' @return The geometric mean ratio of standard deviations.
#' @export

sd_ratio <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  n <- num_examples(x)
  p <- num_features(x)
  q <- num_classes(y)

  x_groups <- split(x, y)
  n_per_class <- vapply(x_groups, num_examples, numeric(1))

  a <- (2 * (p ^ 2) + 3 * p - 1) / (6 * (p + 1) * (q - 1))
  b <- sum(1 / (n_per_class - 1)) - (1 /(n - q))
  gamma <- 1 - a * b

  cov_mat <- cov(x)
  inv_cov_mat_per_class <- lapply(x_groups, function(x) solve(cov(x)))

  a <- n_per_class - 1
  b <- vapply(inv_cov_mat_per_class,
              function(x) log(norm(x %*% cov_mat, type = "F")),
              numeric(1))
  M <- gamma * sum(a * b)

  exp(M / (p * sum(n_per_class - 1)))
}
