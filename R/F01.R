#' Sphere Function (F01)
#'
#' @description
#' The Sphere function is a simple unimodal test function commonly used
#' to evaluate the performance of optimization algorithms. It has a single
#' global minimum at the origin.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n} x_i^2}{f(x) = sum(x_i^2)}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal
#'   \item Separable: Yes
#'   \item Differentiable: Yes
#'   \item Convex: Yes
#'   \item Default bounds: \eqn{[-100, 100]^n}
#'   \item Default dimensions: 50
#' }
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F01(c(0, 0, 0))    # Returns 0 (global minimum)
#' F01(c(1, 2, 3))    # Returns 1 + 4 + 9 = 14
#' F01(rep(0, 50))    # Returns 0 in 50 dimensions
#'
#' @export
F01 <- function(x) {
  # Sphere function
  return(sum(x^2))
}
