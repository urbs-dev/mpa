#' Penalized Function 1 (F12)
#'
#' @description
#' A multimodal test function with penalty terms that create a complex
#' search landscape. Uses the \code{\link{Ufun}} helper function.
#'
#' @param x Numeric vector of input values (minimum length 2).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \frac{\pi}{n}\left\{10\sin^2(\pi y_1) + 
#'   \sum_{i=1}^{n-1}(y_i-1)^2(1 + 10 \sin^2(\pi y_{i+1})) +
#'   (y_n-1)^2\right\} + \sum_{i=1}^{n}u(x_i,10,100,4)}
#'
#' where \eqn{y_i = 1 + (x_i + 1)/4} and \eqn{u(x,a,k,m)} is a penalty function.
#'
#' \strong{Global minimum:} \eqn{f(-1, -1, ..., -1) = 0}
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
#' The penalty term \eqn{u(x,a,k,m)} adds a cost when variables exceed
#' the threshold \eqn{a}, helping to constrain solutions to a feasible region.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters,
#' \code{\link{Ufun}} for the penalty function.
#'
#' @examples
#' F12(c(-1, -1, -1))  # Returns approximately 0 (near global minimum)
#' F12(c(0, 0, 0))     # Returns a small positive value
#'
#' @export
F12 <- function(x) {
  # Penalized function 1
  dim <- length(x)
  term1 <- (pi / dim) * (10 * (sin(pi * (1 + (x[1] + 1) / 4)))^2 +
    sum(((x[1:(dim - 1)] + 1) / 4)^2 *
      (1 + 10 * (sin(pi * (1 + (x[2:dim] + 1) / 4)))^2)) +
    ((x[dim] + 1) / 4)^2)
  term2 <- sum(Ufun(x, 10, 100, 4))
  return(term1 + term2)
}
