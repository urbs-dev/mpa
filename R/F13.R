#' Penalized Function 2 (F13)
#'
#' @description
#' A multimodal test function with different penalty terms than F12,
#' creating a complex search landscape. Uses the \code{\link{Ufun}} helper function.
#'
#' @param x Numeric vector of input values (minimum length 2).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = 0.1\left\{\sin^2(3\pi x_1) +
#'   \sum_{i=1}^{n-1}(x_i-1)^2(1+\sin^2(3\pi x_{i+1})) +
#'   (x_n-1)^2(1+\sin^2(2\pi x_n))\right\} + \sum_{i=1}^{n}u(x_i,5,100,4)}
#'
#' where \eqn{u(x,a,k,m)} is a penalty function.
#'
#' \strong{Global minimum:} \eqn{f(1, 1, ..., 1) = 0}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes (in the interior)
#'   \item Penalized: Yes (boundary penalty)
#'   \item Default bounds: \eqn{[-50, 50]^n}
#'   \item Default dimensions: 50
#' }
#'
#' This function differs from F12 in the sinusoidal terms and penalty threshold,
#' resulting in different landscape characteristics.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters,
#' \code{\link{Ufun}} for the penalty function.
#'
#' @examples
#' F13(c(1, 1, 1))  # Returns approximately 0 (near global minimum)
#' F13(c(0, 0, 0))  # Returns a small positive value
#'
#' @export
F13 <- function(x) {
  # Penalized function 2
  dim <- length(x)
  term1 <- 0.1 * ((sin(3 * pi * x[1]))^2 +
    sum((x[1:(dim - 1)] - 1)^2 * (1 + (sin(3 * pi * x[2:dim]))^2)) +
    ((x[dim] - 1)^2) * (1 + (sin(2 * pi * x[dim]))^2))
  term2 <- sum(Ufun(x, 5, 100, 4))
  return(term1 + term2)
}
