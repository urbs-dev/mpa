#' Kowalik Function (F15)
#'
#' @description
#' A multimodal test function used for testing optimization algorithms,
#' based on fitting experimental data. Fixed dimension of 4.
#'
#' @param x Numeric vector of length 4 (4-dimensional input).
#'
#' @return Numeric scalar representing the function value.
#'
#' @details
#' \strong{Formula:}
#' \deqn{f(x) = \sum_{i=1}^{11}\left(a_i -
#'   \frac{x_1(b_i^2 + b_i x_2)}{b_i^2 + b_i x_3 + x_4}\right)^2}
#'
#' where \eqn{a_i} and \eqn{b_i} are predefined constants from experimental data.
#'
#' \strong{Global minimum:} \eqn{f(0.1928, 0.1908, 0.1231, 0.1358) \approx 0.0003075}
#'
#' \strong{Characteristics:}
#' \itemize{
#'   \item Type: Multimodal
#'   \item Separable: No
#'   \item Differentiable: Yes
#'   \item Fixed dimension: 4
#'   \item Default bounds: \eqn{[-5, 5]^4}
#' }
#'
#' This function is derived from a curve-fitting problem and has several
#' local minima near the global minimum.
#'
#' @seealso
#' \code{\link{test-functions}} for an overview of all test functions,
#' \code{\link{get_function_details}} to retrieve function parameters.
#'
#' @examples
#' F15(c(0.1928, 0.1908, 0.1231, 0.1358))  # Returns approximately 0.0003
#' F15(c(0, 0, 0, 0))  # Returns a larger value
#'
#' @export
F15 <- function(x) {
  # Kowalik function
  aK <- c(0.1957, 0.1947, 0.1735, 0.16, 0.0844, 0.0627,
          0.0456, 0.0342, 0.0323, 0.0235, 0.0246)
  bK <- c(0.25, 0.5, 1, 2, 4, 6, 8, 10, 12, 14, 16)
  bK <- 1 / bK
  return(sum((aK - ((x[1] * (bK^2 + x[2] * bK)) /
                      (bK^2 + x[3] * bK + x[4])))^2))
}
