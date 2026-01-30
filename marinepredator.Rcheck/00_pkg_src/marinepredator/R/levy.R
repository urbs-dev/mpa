#' Levy Flight Random Step Generator
#'
#' @description
#' Generates Levy flight random steps for optimization algorithms.
#' Levy flight is characterized by a heavy-tailed power-law distribution and is
#' used to model the movement patterns of marine predators, allowing for
#' occasional long jumps that help escape local optima.
#'
#' @param n Number of rows (typically the number of search agents).
#' @param m Number of columns (typically the number of dimensions).
#' @param beta Power law exponent controlling the tail heaviness of the
#'   distribution. Must satisfy \code{1 < beta < 2}. Lower values produce
#'   heavier tails (more frequent long jumps). The value 1.5 is commonly used.
#'
#' @return A numeric matrix of dimension \code{n x m} containing Levy flight
#'   step values. Each element represents a random step drawn from the Levy
#'   distribution.
#'
#' @details
#' The Levy flight step is computed using Mantegna's algorithm:
#'
#' \deqn{L = u / |v|^{1/\beta}}
#'
#' where \eqn{u \sim N(0, \sigma_u^2)} and \eqn{v \sim N(0, 1)}, with:
#'
#' \deqn{\sigma_u = \left( \frac{\Gamma(1+\beta) \cdot \sin(\pi \beta / 2)}
#'   {\Gamma((1+\beta)/2) \cdot \beta \cdot 2^{(\beta-1)/2}} \right)^{1/\beta}}
#'
#' Levy flights are used in MPA during Phase 2 (for half the population) and
#' Phase 3 (for all agents) to balance exploration and exploitation.
#'
#' @references
#' Mantegna, R. N. (1994). Fast, accurate algorithm for numerical simulation
#' of Levy stable stochastic processes. Physical Review E, 49(5), 4677.
#'
#' Yang, X. S., & Deb, S. (2013). Multiobjective cuckoo search for design
#' optimization. Computers & Operations Research, 40(6), 1616-1624.
#'
#' @seealso [mpa()] for the main algorithm that uses Levy flights.
#'
#' @examples
#' # Generate 10 Levy flight steps in 2 dimensions with beta = 1.5
#' steps <- levy(10, 2, 1.5)
#' dim(steps)  # 10 x 2
#'
#' # Visualize the distribution of Levy steps
#' steps_1d <- levy(1000, 1, 1.5)
#' hist(steps_1d, breaks = 50, main = "Levy Flight Distribution")
#'
#' @export
levy <- function(n, m, beta) {
  
  # Check beta is in valid range
  if (beta <= 1 || beta >= 2) {
    stop("beta must be between 1 and 2")
  }
  
  # Calculate numerator and denominator for sigma_u
  num <- gamma(1 + beta) * sin(pi * beta / 2)
  den <- gamma((1 + beta)/2) * beta * 2^((beta - 1)/2)
  
  # Standard deviation
  sigma_u <- (num / den)^(1/beta)
  
  # Generate normal random variables
  u <- matrix(stats::rnorm(n * m, mean = 0, sd = sigma_u), nrow = n, ncol = m)
  v <- matrix(stats::rnorm(n * m, mean = 0, sd = 1), nrow = n, ncol = m)
  
  # Calculate Levy steps
  z <- u / (abs(v)^(1/beta))
  
  return(z)
}
