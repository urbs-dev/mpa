#' Ackley Function (F10)
#'
#' @description
#' A widely used multimodal test function characterized by a nearly flat outer
#' region with a large central hole at the origin. It poses a risk for
#' optimization algorithms to be trapped in local minima.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = -20\exp\left(-0.2\sqrt{\frac{1}{n}\sum_{i=1}^{n}x_i^2}\right)
#'   - \exp\left(\frac{1}{n}\sum_{i=1}^{n}\cos(2\pi x_i)\right) + 20 + e}{
#'   f(x) = -20 exp(-0.2 sqrt(mean(x^2))) - exp(mean(cos(2 pi*x))) + 20 + e}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Default bounds: \eqn{[-32, 32]^n}
#'   \item Default dimensions: 50
#' }
#'
#' The Ackley function has an exponential term covering its surface with
#' numerous local minima. The function poses a risk of premature convergence
#' for hill-climbing algorithms.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F10(c(0, 0))  # Returns approximately 0 (global minimum)
#' F10(c(1, 1))  # Returns approximately 3.6
#'
#' @export
F10 <- function(x) {
  # Ackley function
  dim <- length(x)
  term1 <- -20 * exp(-0.2 * sqrt(sum(x^2) / dim))
  term2 <- -exp(sum(cos(2 * pi * x)) / dim)
  return(term1 + term2 + 20 + exp(1))
}
