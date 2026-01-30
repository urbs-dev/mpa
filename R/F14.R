#' Shekel's Foxholes Function (F14)
#'
#' @description
#' A multimodal test function with 25 local minima of different depths,
#' arranged in a grid pattern. Fixed dimension of 2.
#'
#' @param x Numeric vector of length 2 (2-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \left(\frac{1}{500} +
#'   \sum_{j=1}^{25}\frac{1}{j + \sum_{i=1}^{2}(x_i - a_{ij})^6}\right)^{-1}}
#'
#' where \eqn{a_{ij}} are predefined constants forming a 5x5 grid.
#'
#' \strong{Global minimum:} \eqn{f(-32, -32) \approx 0.998}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 2
#'   \item Number of local minima: 25
#'   \item Default bounds: \eqn{[-65.536, 65.536]^2}
#' }
#'
#' The 25 minima are located at points from a 5x5 grid with coordinates
#' \eqn{(-32, -16, 0, 16, 32)} in each dimension.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F14(c(-32, -32))  # Returns approximately 0.998 (global minimum)
#' F14(c(0, 0))      # Returns approximately 10
#'
#' @export
F14 <- function(x) {
  # Shekel's Foxholes
  aS <- matrix(c(
    -32, -16, 0, 16, 32, -32, -16, 0, 16, 32, -32, -16, 0, 16, 32,
    -32, -16, 0, 16, 32, -32, -16, 0, 16, 32,
    -32, -32, -32, -32, -32, -16, -16, -16, -16, -16, 0, 0, 0, 0, 0,
    16, 16, 16, 16, 16, 32, 32, 32, 32, 32
  ), nrow = 2, ncol = 25, byrow = FALSE)

  bS <- rep(0, 25)
  for (j in 1:25) {
    bS[j] <- sum((x - aS[, j])^6)
  }
  return((1 / 500 + sum(1 / ((1:25) + bS)))^(-1))
}
