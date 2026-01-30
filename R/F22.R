#' Shekel 7 Function (F22)
#'
#' @description
#' A multimodal test function from the Shekel family with 7 local minima.
#' Fixed dimension of 4.
#'
#' @param x Numeric vector of length 4 (4-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = -\sum_{i=1}^{7} \frac{1}{(x - a_i)^T(x - a_i) + c_i}}
#'
#' where \eqn{a_i} are 4-dimensional vectors and \eqn{c_i} are scalars.
#'
#' \strong{Global minimum:} \eqn{f(4, 4, 4, 4) \approx -10.4029}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 4
#'   \item Number of local minima: 7
#'   \item Default bounds: \eqn{[0, 10]^4}
#' }
#'
#' The Shekel 7 function has more local minima than Shekel 5, making it
#' slightly more challenging.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters,
#' \code{\link{F21}} for Shekel 5, \code{\link{F23}} for Shekel 10.
#'
#' @examples
#' F22(c(4, 4, 4, 4))  # Returns approximately -10.40 (near global minimum)
#' F22(c(0, 0, 0, 0))  # Returns a value close to 0
#'
#' @export
F22 <- function(x) {
  # Shekel 7 function
  aSH <- matrix(c(
    4, 4, 4, 4,
    1, 1, 1, 1,
    8, 8, 8, 8,
    6, 6, 6, 6,
    3, 7, 3, 7,
    2, 9, 2, 9,
    5, 5, 3, 3,
    8, 1, 8, 1,
    6, 2, 6, 2,
    7, 3.6, 7, 3.6
  ), nrow = 10, ncol = 4, byrow = TRUE)
  cSH <- c(0.1, 0.2, 0.2, 0.4, 0.4, 0.6, 0.3, 0.7, 0.5, 0.5)

  o <- 0
  for (i in 1:7) {
    o <- o - ((x - aSH[i, ]) %*% (x - aSH[i, ]) + cSH[i])^(-1)
  }
  return(o)
}
