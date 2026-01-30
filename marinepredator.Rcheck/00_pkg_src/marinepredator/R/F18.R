#' Goldstein-Price Function (F18)
#'
#' @description
#' A multimodal test function with four local minima and one global minimum.
#' Fixed dimension of 2.
#'
#' @param x Numeric vector of length 2 (2-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = (1 + (x_1 + x_2 + 1)^2(19 - 14x_1 + 3x_1^2 - 14x_2 + 6x_1 x_2 + 3x_2^2))
#'   \times (30 + (2x_1 - 3x_2)^2(18 - 32x_1 + 12x_1^2 + 48x_2 - 36x_1 x_2 + 27x_2^2))}
#'
#' \strong{Global minimum:} \eqn{f(0, -1) = 3}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 2
#'   \item Number of local minima: 4
#'   \item Default bounds: \eqn{[-2, 2]^2}
#' }
#'
#' The Goldstein-Price function has a complex landscape with the global
#' minimum surrounded by local minima of increasing value.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F18(c(0, -1))  # Returns 3 (global minimum)
#' F18(c(0, 0))   # Returns 600
#'
#' @export
F18 <- function(x) {
  # Goldstein-Price function
  term1 <- 1 + (x[1] + x[2] + 1)^2 *
    (19 - 14 * x[1] + 3 * (x[1]^2) - 14 * x[2] + 6 * x[1] * x[2] + 3 * (x[2]^2))
  term2 <- 30 + (2 * x[1] - 3 * x[2])^2 *
    (18 - 32 * x[1] + 12 * (x[1]^2) + 48 * x[2] - 36 * x[1] * x[2] + 27 * (x[2]^2))
  return(term1 * term2)
}
