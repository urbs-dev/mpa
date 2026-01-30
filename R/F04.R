#' Maximum Absolute Value (F04)
#'
#' @description
#' A unimodal test function that returns the maximum absolute value
#' in the input vector, also known as the Schwefel 2.21 function.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \max_i |x_i|}{f(x) = max(|x_i|)}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal
#'   \item Separable: No
#'   \item Differentiable: No
#'   \item Convex: Yes
#'   \item Default bounds: \eqn{[-100, 100]^n}
#'   \item Default dimensions: 50
#' }
#'
#' This function is particularly challenging because it only depends on the
#' single variable with the largest absolute value, making gradient-based
#' information less useful.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F04(c(0, 0, 0))    # Returns 0 (global minimum)
#' F04(c(-1, 2, -3))  # Returns 3
#' F04(c(5, -5, 5))   # Returns 5
#'
#' @export
F04 <- function(x) {
  # Maximum absolute value
  return(max(abs(x)))
}
