#' Marine Predators Algorithm (MPA)
#'
#' @description Implementation of the Marine Predators Algorithm (MPA) in R. MPA
#'   is a nature-inspired optimization algorithm that follows the rules
#'   governing optimal foraging strategy and encounter rate policy between
#'   predator and prey in marine ecosystems.
#'
#' @param SearchAgents_no Number of search agents (predators). At least 2.
#'   Typical values range from 20 to 50.
#' @param Max_iter Maximum number of iterations. At least 3.
#'   Typical values range from 100 to 500 depending on problem complexity.
#' @param lb Lower bounds for each dimension. Can be a single value (applied to
#'   all dimensions) or a vector of length \code{dim}.
#' @param ub Upper bounds for each dimension. Can be a single value (applied to
#'   all dimensions) or a vector of length \code{dim}.
#' @param dim Number of dimensions (decision variables) in the optimization problem.
#' @param fobj Objective function to minimize. Must accept a numeric vector of
#'   length \code{dim} and return a single numeric value.
#' @param logFile A path for logging (text file). Defaulted to \code{NULL}. If
#'   \code{NULL}, no logging is performed.
#' @param ... Additional arguments. Currently supports \code{prefix} for log
#'   message prefixing. See Details.
#'
#' @return An object of class \code{mpa_result}, which is a list containing:
#'   \item{Top_predator_fit}{Best fitness value found (numeric scalar)}
#'   \item{Top_predator_pos}{Best position found (numeric vector of length \code{dim})}
#'   \item{Convergence_curve}{Convergence curve over iterations (numeric vector
#'     of length \code{Max_iter})}
#'
#' @details
#' This is a \strong{minimization} algorithm. To maximize a function, negate its
#' output (e.g., use \code{function(x) -f(x)} instead of \code{f}).
#'
#' @section Algorithm Phases:
#' The MPA algorithm operates in three distinct phases based on the iteration count:
#'
#' \describe{
#'   \item{Phase 1 (iterations 0 to Max_iter/3)}{
#'     \strong{High velocity ratio} - The prey moves faster than the predator.
#'     Exploration is emphasized using Brownian motion. This phase promotes
#'     global search across the solution space.
#'   }
#'   \item{Phase 2 (iterations Max_iter/3 to 2*Max_iter/3)}{
#'     \strong{Unit velocity ratio} - Predator and prey move at similar speeds.
#'     The population is split: half uses Brownian motion (exploitation),
#'     half uses Levy flight (exploration). This balances exploration and exploitation.
#'   }
#'   \item{Phase 3 (iterations 2*Max_iter/3 to Max_iter)}{
#'     \strong{Low velocity ratio} - The predator moves faster than the prey.
#'     Levy flight is used for all agents, focusing on exploitation around
#'     the best solution found.
#'   }
#' }
#'
#' @section Internal Parameters:
#' The algorithm uses two internal parameters that are not exposed:
#' \describe{
#'   \item{FADs}{Fish Aggregating Devices effect parameter, set to 0.2.
#'     Controls the probability of applying the FADs effect which helps
#'     escape local optima.}
#'   \item{P}{Prey movement probability, set to 0.5. Controls the step size
#'     scaling factor during position updates.}
#' }
#'
#' @section Memory Mechanism:
#' MPA implements a memory mechanism (Marine Memory) that preserves the best
#' positions found by each agent. If a new position has worse fitness than the
#' previous one, the agent reverts to its previous position.
#'
#' @section Additional Arguments:
#' The \code{...} parameter currently accepts:
#' \describe{
#'   \item{prefix}{A character string to prefix log messages. Defaults to
#'     empty string if not provided.}
#' }
#'
#' @examples
#' # Basic usage with the Sphere function (F01)
#' result <- mpa(
#'   SearchAgents_no = 25, Max_iter = 100, lb = -100, ub = 100,
#'   dim = 30, fobj = F01
#' )
#' print(result)
#'
#' # Using different bounds per dimension
#' result2 <- mpa(
#'   SearchAgents_no = 20, Max_iter = 50,
#'   lb = c(-5, 0), ub = c(10, 15),
#'   dim = 2, fobj = F17
#' )
#'
#' # Maximization example (negate the objective function)
#' maximize_f <- function(x) -sum(x^2)
#' result3 <- mpa(
#'   SearchAgents_no = 20, Max_iter = 50,
#'   lb = -10, ub = 10, dim = 5,
#'   fobj = function(x) -maximize_f(x)
#' )
#' # The actual maximum value is -result3$Top_predator_fit
#'
#' @seealso
#' [get_function_details()] for benchmark functions,
#' [levy()] for Levy flight implementation,
#' [initialize_population()] for population initialization.
#'
#' @references Faramarzi, A., Heidarinejad, M., Mirjalili, S., & Gandomi, A. H.
#' (2020). Marine Predators Algorithm: A Nature-inspired Metaheuristic. Expert
#' Systems with Applications, 152, 113377.
#' \doi{10.1016/j.eswa.2020.113377}
#'
#' @export
mpa <- function(SearchAgents_no, Max_iter, lb, ub, dim, fobj, logFile = NULL, ...) {
  opts <- list(...)
  prefix <- opts$prefix

  if (is.null(prefix)) {
    prefix <- ""
  }

  # Initialize variables
  Top_predator_pos <- numeric(dim)
  Top_predator_fit <- numeric(1)

  Convergence_curve <- numeric(Max_iter)
  stepsize <- matrix(nrow = SearchAgents_no, ncol = dim)
  fitness <- numeric(SearchAgents_no)

  # Initialize prey population
  Prey_old <- Prey <- initialize_population(SearchAgents_no, dim, ub, lb)

  # Set bounds
  Xmin <- matrix(lb, nrow = SearchAgents_no, ncol = dim, byrow = TRUE)
  Xmax <- matrix(ub, nrow = SearchAgents_no, ncol = dim, byrow = TRUE)

  # Parameters
  Iter <- 0
  FADs <- 0.2
  P <- 0.5

  # Main optimization loop -----------------------------------------------------
  for (Iter in 0:(Max_iter - 1)) {
    fitness <- apply(Prey, 1, fobj)
    best_index <- which.min(fitness)
    Top_predator_fit <- fitness[best_index]
    Top_predator_pos <- Prey[best_index, ]

    if (!is.null(x = logFile)) {
      log_ <- paste0(
        prefix,
        "MPA iteration ", Iter, ": Top predator fit = ",
        Top_predator_fit, "\n"
      )
      cat(log_, file = logFile, append = TRUE)
    }

    # Marine Memory saving
    if (Iter == 0) {
      fit_old <- fitness
    }

    # Update prey based on memory
    Inx <- fit_old < fitness

    Prey[Inx, ] <- Prey_old[Inx, ]
    fitness[Inx] <- fit_old[Inx]

    fit_old <- fitness
    Prey_old <- Prey

    # Elite matrix
    Elite <- matrix(
      data = Top_predator_pos,
      nrow = SearchAgents_no,
      ncol = dim,
      byrow = TRUE
    )
    CF <- (1 - Iter / Max_iter)^(2 * Iter / Max_iter)

    # Levy and Brownian random vectors
    RL <- 0.05 * levy(SearchAgents_no, dim, 1.5)
    RB <- matrix(
      data = stats::rnorm(SearchAgents_no * dim),
      nrow = SearchAgents_no,
      ncol = dim
    )

    # Update prey positions based on phases
    if (Iter < Max_iter / 3) {
      # Phase 1: High velocity ratio (prey moves faster than predator)
      R <- stats::runif(1)

      stepsize <- RB * (Elite - RB * Prey)

      Prey <- Prey + P * R * stepsize
    } else if (Iter > Max_iter / 3 && Iter < 2 * Max_iter / 3) {
      # Phase 2: Unit velocity ratio (both move at similar pace)
      # For the first half of the population
      p3 <- SearchAgents_no
      p1 <- ceiling(x = p3 / 2)
      p2 <- p1 + 1

      stepsize[1:p1, ] <- RB[1:p1, ] * (RB[1:p1, ] * Elite[1:p1, ] - Prey[1:p1, ])

      Prey[1:p1, ] <- Elite[1:p1, ] + P * CF * stepsize[1:p1, ]

      # For the second half of the population
      stepsize[p2:p3, ] <- RL[p2:p3, ] * (Elite[p2:p3, ] - RL[p2:p3, ] * Prey[p2:p3, ])

      Prey[p2:p3, ] <- Prey[p2:p3, ] + P * R * stepsize[p2:p3, ]
    } else {
      # Phase 3: Low velocity ratio (predator moves faster than prey)
      stepsize <- RL * (RL * Elite - Prey)
      Prey <- Elite + P * CF * stepsize
    }


    # Detecting top predator again
    Prey <- pmax(pmin(Prey, Xmax), Xmin)
    fitness <- apply(Prey, 1, fobj)
    best_index <- which.min(fitness)
    Top_predator_fit <- fitness[best_index]
    Top_predator_pos <- Prey[best_index, ]

    # Marine Memory saving
    if (Iter == 0) {
      fit_old <- fitness
      Prey_old <- Prey
    }

    # Update prey based on memory
    Inx <- fit_old < fitness

    Prey[Inx, ] <- Prey_old[Inx, ]
    fitness[Inx] <- fit_old[Inx]

    fit_old <- fitness
    Prey_old <- Prey

    # Eddy formation and FADs effect
    FADs_random <- stats::runif(1) < FADs
    if (FADs_random) {
      U <-
        stats::runif(SearchAgents_no * dim) < FADs %>%
          matrix(nrow = SearchAgents_no, ncol = dim)

      step_fctr <-
        stats::runif(SearchAgents_no * dim) %>%
        matrix(nrow = SearchAgents_no, ncol = dim)

      Prey <- Prey + CF * (Xmin + step_fctr * (Xmax - Xmin)) * U
    } else {
      r <- stats::runif(1)
      Rs <- nrow(Prey)
      stepsize <- (FADs * (1 - r) + r) * (Prey[sample(Rs), ] - Prey[sample(Rs), ])
      Prey <- Prey + stepsize
    }

    # Update iteration counter and convergence curve
    Convergence_curve[Iter + 1] <- Top_predator_fit
  }

  # Return results
  res <- list(
    Top_predator_fit = Top_predator_fit,
    Top_predator_pos = Top_predator_pos,
    Convergence_curve = Convergence_curve
  )

  class(res) <- c("mpa_result", class(res))

  res
}

#' Print method for MPA results
#'
#' @description
#' Prints a summary of the Marine Predators Algorithm optimization results.
#'
#' @param x An object of class \code{mpa_result} returned by \code{\link{mpa}}.
#' @param ... Additional arguments (currently unused).
#'
#' @return Invisibly returns the input object \code{x}.
#'
#' @examples
#' result <- mpa(SearchAgents_no = 10, Max_iter = 20, lb = -10, ub = 10,
#'               dim = 5, fobj = F01)
#' print(result)
#'
#' @export
print.mpa_result <- function(x, ...) {
  cat("Marine Predators Algorithm Results:\n")
  cat("-----------------------------------\n")
  cat(sprintf("Best fitness: %.10f\n", x$Top_predator_fit))
  cat(sprintf("Best position: %s\n", paste(round(x$Top_predator_pos, 10), collapse = " ")))
  cat(sprintf("Convergence curve length: %d\n", length(x$Convergence_curve)))
  invisible(x)
}
