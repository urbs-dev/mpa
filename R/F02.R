#' Sum of Absolute Values and Products (F02)
#'
#' @description
#' A unimodal test function that combines the sum of absolute values
#' and the product of absolute values.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n} |x_i| + \prod_{i=1}^{n} |x_i|}{
#'   f(x) = sum(|x_i|) + prod(|x_i|)}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal
#'   \item Separable: No (due to product term)
#'   \item Differentiable: No (at points where any x_i = 0)
#'   \item Convex: Yes
#'   \item Default bounds: \eqn{[-10, 10]^n}
#'   \item Default dimensions: 50
#' }
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F02(c(0, 0))      # Returns 0 (global minimum)
#' F02(c(1, 2))      # Returns |1| + |2| + |1|*|2| = 1 + 2 + 2 = 5
#' F02(c(-1, -2))    # Returns 1 + 2 + 2 = 5
#'
#' @export
F02 <- function(x) {
  # Sum of absolute values and products
  return(sum(abs(x)) + prod(abs(x)))
}
