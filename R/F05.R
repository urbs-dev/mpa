#' Rosenbrock Function (F05)
#'
#' @description
#' The Rosenbrock function (also known as Rosenbrock's valley or banana function)
#' is a classic test function with a narrow, curved valley. While often described
#' as unimodal, it is technically multimodal for \eqn{n \geq 4}.
#'
#' @param x Numeric vector of input values (minimum length 2).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n-1} \left[100(x_{i+1} - x_i^2)^2 + (x_i - 1)^2\right]}{
#'   f(x) = sum_{i=1}^{n-1} [100*(x_{i+1} - x_i^2)^2 + (x_i - 1)^2]}
#'
#' \strong{Global minimum:} \eqn{f(1, 1, ..., 1) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal (for n < 4), Multimodal (for n >= 4)
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Convex: No
#'   \item Default bounds: \eqn{[-30, 30]^n}
#'   \item Default dimensions: 50
#' }
#'
#' The global minimum lies inside a long, narrow, parabolic-shaped flat valley.
#' Finding the valley is trivial, but converging to the global minimum is difficult.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F05(c(1, 1))       # Returns 0 (global minimum)
#' F05(c(0, 0))       # Returns 1
#' F05(c(1, 1, 1, 1)) # Returns 0 (global minimum in 4D)
#'
#' @export
F05 <- function(x) {
  # Rosenbrock function
  dim <- length(x)
  return(sum(100 * (x[2:dim] - x[1:(dim - 1)]^2)^2 + (x[1:(dim - 1)] - 1)^2))
}
