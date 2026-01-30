#' Sum of Squared Cumulative Sums (F03)
#'
#' @description
#' A unimodal test function that calculates the sum of squared cumulative sums,
#' also known as the Schwefel 2.22 variant.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n} \left(\sum_{j=1}^{i} x_j\right)^2}{
#'   f(x) = sum_{i=1}^n (sum_{j=1}^i x_j)^2}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Convex: Yes
#'   \item Default bounds: \eqn{[-100, 100]^n}
#'   \item Default dimensions: 50
#' }
#'
#' This function is non-separable because each term depends on all previous
#' variables, making it useful for testing algorithms' ability to handle
#' variable dependencies.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F03(c(0, 0, 0))    # Returns 0 (global minimum)
#' F03(c(1, 2, 3))    # Returns 1^2 + (1+2)^2 + (1+2+3)^2 = 1 + 9 + 36 = 46
#'
#' @export
F03 <- function(x) {
  # Sum of squared terms
  dim <- length(x)
  o <- 0
  for (i in 1:dim) {
    o <- o + sum(x[1:i])^2
  }
  return(o)
}
