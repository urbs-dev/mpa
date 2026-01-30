#' Hartmann 3D Function (F19)
#'
#' @description
#' A multimodal test function with 4 local minima in 3 dimensions.
#' Fixed dimension of 3.
#'
#' @param x Numeric vector of length 3 (3-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = -\sum_{i=1}^{4} c_i \exp\left(-\sum_{j=1}^{3} a_{ij}(x_j - p_{ij})^2\right)}
#'
#' where \eqn{a_{ij}}, \eqn{c_i}, and \eqn{p_{ij}} are predefined constants.
#'
#' \strong{Global minimum:} \eqn{f(0.114614, 0.555649, 0.852547) \approx -3.86278}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 3
#'   \item Number of local minima: 4
#'   \item Default bounds: \eqn{[0, 1]^3}
#' }
#'
#' The Hartmann functions are a family of multimodal test functions commonly
#' used in optimization benchmarks.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters,
#' \code{\link{F20}} for the 6D version.
#'
#' @examples
#' F19(c(0.114614, 0.555649, 0.852547))  # Returns approximately -3.86278
#' F19(c(0.5, 0.5, 0.5))  # Returns a value > -3.86
#'
#' @export
F19 <- function(x) {
  # Hartman 3D function
  aH <- matrix(c(
    3, 10, 30,
    0.1, 10, 35,
    3, 10, 30,
    0.1, 10, 35
  ), nrow = 4, ncol = 3, byrow = TRUE)
  cH <- c(1, 1.2, 3, 3.2)
  pH <- matrix(c(
    0.3689, 0.117, 0.2673,
    0.4699, 0.4387, 0.747,
    0.1091, 0.8732, 0.5547,
    0.03815, 0.5743, 0.8828
  ), nrow = 4, ncol = 3, byrow = TRUE)

  o <- 0
  for (i in 1:4) {
    o <- o - cH[i] * exp(-(sum(aH[i, ] * ((x - pH[i, ])^2))))
  }
  return(o)
}
