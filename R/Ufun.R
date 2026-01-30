#' Penalty Function for Penalized Test Functions
#'
#' @description
#' Helper function used in penalized test functions (F12, F13). This function
#' applies a penalty when variable values exceed specified bounds.
#'
#' @param x Numeric vector of input values to penalize.
#' @param a Threshold value. Penalty is applied when \eqn{|x_i| > a}.
#' @param k Penalty coefficient controlling the penalty magnitude.
#' @param m Exponent for the penalty term.
#'
#' @return Numeric vector of penalty values (same length as \code{x}).
#'
#' @details
#' \strong{Formula:}
#' \deqn{u(x_i, a, k, m) = \begin{cases}
#'   k(x_i - a)^m & \text{if } x_i > a \\
#'   0 & \text{if } -a \leq x_i \leq a \\
#'   k(-x_i - a)^m & \text{if } x_i < -a
#' \end{cases}}
#'
#' The penalty function is zero within the interval \eqn{[-a, a]} and grows
#' polynomially outside this region. This is used to softly constrain
#' optimization to a bounded region without hard constraints.
#'
#' @seealso \code{\link{F12}}, \code{\link{F13}} for functions that use this helper.
#'
#' @keywords internal
Ufun <- function(x, a, k, m) {
  return(k * ((x - a)^m) * (x > a) + k * ((-x - a)^m) * (x < (-a)))
}
