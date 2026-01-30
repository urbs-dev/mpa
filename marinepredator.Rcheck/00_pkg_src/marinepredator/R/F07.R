#' Quartic Function with Noise (F07)
#'
#' @description
#' A unimodal test function with quartic terms and added uniform random noise.
#' The noise makes this a stochastic function, useful for testing robustness.
#'
#' @param x Numeric vector of input values.
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{n} i \cdot x_i^4 + \text{random}[0,1)}{
#'   f(x) = sum(i * x_i^4) + random[0,1)}
#'
#' \strong{Global minimum:} \eqn{f(0, 0, ..., 0) \approx 0} (stochastic, depends on noise)
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Unimodal (with noise)
#'   \item Separable: Yes (deterministic part)
#'   \item Differentiable: Yes
#'   \item Stochastic: Yes (random noise added)
#'   \item Default bounds: \eqn{[-1.28, 1.28]^n}
#'   \item Default dimensions: 50
#' }
#'
#' The random noise component makes function evaluations non-deterministic,
#' testing an algorithm's ability to handle noisy objective functions.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F07(c(0, 0, 0))  # Returns a value close to 0 (with some noise)
#' # Multiple calls may return different values due to noise:
#' replicate(5, F07(c(0, 0, 0)))
#'
#' @export
F07 <- function(x) {
  # Quartic function with noise
  dim <- length(x)
  return(sum((1:dim) * (x^4)) + stats::runif(1))
}
