#' Hartmann 6D Function (F20)
#'
#' @description
#' A multimodal test function with 6 local minima in 6 dimensions.
#' Fixed dimension of 6.
#'
#' @param x Numeric vector of length 6 (6-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = -\sum_{i=1}^{4} c_i \exp\left(-\sum_{j=1}^{6} a_{ij}(x_j - p_{ij})^2\right)}
#'
#' where \eqn{a_{ij}}, \eqn{c_i}, and \eqn{p_{ij}} are predefined constants.
#'
#' \strong{Global minimum:}
#' \eqn{f(0.20169, 0.150011, 0.476874, 0.275332, 0.311652, 0.6573) \approx -3.32237}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 6
#'   \item Number of local minima: 6
#'   \item Default bounds: \eqn{[0, 1]^6}
#' }
#'
#' The Hartmann 6D function is more challenging than the 3D version due to
#' the higher dimensionality.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters,
#' \code{\link{F19}} for the 3D version.
#'
#' @examples
#' F20(c(0.20169, 0.150011, 0.476874, 0.275332, 0.311652, 0.6573))
#' # Returns approximately -3.32237
#'
#' @export
F20 <- function(x) {
  # Hartman 6D function
  aH <- matrix(c(
    10, 3, 17, 3.5, 1.7, 8,
    0.05, 10, 17, 0.1, 8, 14,
    3, 3.5, 1.7, 10, 17, 8,
    17, 8, 0.05, 10, 0.1, 14
  ), nrow = 4, ncol = 6, byrow = TRUE)
  cH <- c(1, 1.2, 3, 3.2)
  pH <- matrix(c(
    0.1312, 0.1696, 0.5569, 0.0124, 0.8283, 0.5886,
    0.2329, 0.4135, 0.8307, 0.3736, 0.1004, 0.9991,
    0.2348, 0.1415, 0.3522, 0.2883, 0.3047, 0.6650,
    0.4047, 0.8828, 0.8732, 0.5743, 0.1091, 0.0381
  ), nrow = 4, ncol = 6, byrow = TRUE)

  o <- 0
  for (i in 1:4) {
    o <- o - cH[i] * exp(-(sum(aH[i, ] * ((x - pH[i, ])^2))))
  }
  return(o)
}
