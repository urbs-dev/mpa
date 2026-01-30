#' Griewank Function (F11)
#'
#' @description
#' A multimodal test function with many regularly distributed local minima.
#' The complexity increases with the number of dimensions.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \frac{1}{4000}\sum_{i=1}^{n}x_i^2 -
#'   \prod_{i=1}^{n}\cos\left(\frac{x_i}{\sqrt{i}}\right) + 1}{
#'   f(x) = sum(x^2)/4000 - prod(cos(x/sqrt(1:n))) + 1}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Default bounds: \eqn{[-600, 600]^n}
#'   \item Default dimensions: 50
#' }
#'
#' The Griewank function has a product term that introduces interdependence
#' among the variables. As dimension increases, the function becomes more
#' difficult to optimize.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F11(c(0, 0))  # Returns 0 (global minimum)
#' F11(c(1, 1))  # Returns approximately 0.007
#'
#' @export
F11 <- function(x) {
  # Griewank function
  dim <- length(x)
  term1 <- sum(x^2) / 4000
  term2 <- prod(cos(x / sqrt(1:dim)))
  return(term1 - term2 + 1)
}
