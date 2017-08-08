#' Split a Data Set into Predictors and Target.
#'
#' \code{split_x_and_y} splits the input data set into the predictors x
#' and the target y.
#'
#' @param data A data frame containing both predictors and target variables.
#' @param target The column index or the name of the target variable. If not
#'  provided the target is assumed to be the last column of \code{data}.
#' @return A list containing the predictors (x) and the target (y) variables.
#' @export

split_x_and_y <- function(data, target = ncol(data)){
  y <- data[[target]]

  if (is.numeric(target)){
    x <- data[-target]
  } else if (is.character(target)){
    target <- which(colnames(data) == target)
    x <- data[-target]
  } else{
    stop("target must be either a column index or name.",
         call. = FALSE)
  }

  list(x = x, y = y)
}
