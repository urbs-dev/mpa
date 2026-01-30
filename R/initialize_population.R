#' Initialize Population
#'
#' @description
#' Initializes the first population of search agents (prey) for the Marine Predators Algorithm.
#'
#' @param SearchAgents_no Number of search agents
#' @param dim Number of dimensions
#' @param ub Upper bounds for each dimension
#' @param lb Lower bounds for each dimension
#'
#' @return A matrix of initialized positions
#'
#' @examples
#' # Initialize a population of 25 agents in 30 dimensions with bounds [-100, 100]
#' population <- initialize_population(25, 30, 100, -100)
#'
#' @export
initialize_population <- function(SearchAgents_no, dim, ub, lb) {
  # If bounds are single values (same for all dimensions)
  if (length(ub) == 1 && length(lb) == 1) {
    Positions <- matrix(stats::runif(SearchAgents_no * dim, lb, ub),
      nrow = SearchAgents_no,
      ncol = dim
    )
  } else if (length(ub) == dim && length(lb) == dim) {
    # If each dimension has different bounds

    Positions <-
      sapply(1:dim, function(i) stats::runif(SearchAgents_no, lb[i], ub[i]))
  } else {
    stop("Bounds must be either single values or vectors of length equal to dim")
  }

  return(Positions)
}
