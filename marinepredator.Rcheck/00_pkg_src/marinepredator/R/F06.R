#' Step Function / Shifted Sphere (F06)
#'
#' @description
#' A shifted version of the Sphere function with the minimum at
#' \eqn{(-0.5, -0.5, ..., -0.5)}, also known as the Step function.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n} (x_i + 0.5)^2}{f(x) = sum((x_i + 0.5)^2)}
#'
#' \strong{Global minimum:} \eqn{f(-0.5, -0.5, ..., -0.5) = 0}
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
#' This function tests the algorithm's ability to find optima that are not
#' located at the origin.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F06(c(-0.5, -0.5))       # Returns 0 (global minimum)
#' F06(c(0, 0))             # Returns 0.5
#' F06(rep(-0.5, 50))       # Returns 0 in 50 dimensions
#'
#' @export
F06 <- function(x) {
  # Shifted sphere function
  return(sum((x + 0.5)^2))
}
