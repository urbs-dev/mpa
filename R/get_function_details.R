#' Get Function Details
#'
#' @description
#' Retrieves the details (bounds, dimension, and function object) for a specific
#' benchmark test function.
#'
#' @param function_name Name of the test function (e.g., "F01", "F02", ..., "F23")
#'
#' @return A list containing:
#' \item{lb}{Lower bounds for the function}
#' \item{ub}{Upper bounds for the function}
#' \item{dim}{Number of dimensions}
#' \item{fobj}{The objective function}
#'
#' @examples
#' # Get details for the Sphere function (F01)
#' details <- get_function_details("F01")
#' str(details)
#'
#' @export
get_function_details <- function(function_name) {

  # Define function details
  function_details <- list(
    F01 = list(lb = -100, ub = 100, dim = 50, fobj = F01),
    F02 = list(lb = -10, ub = 10, dim = 50, fobj = F02),
    F03 = list(lb = -100, ub = 100, dim = 50, fobj = F03),
    F04 = list(lb = -100, ub = 100, dim = 50, fobj = F04),
    F05 = list(lb = -30, ub = 30, dim = 50, fobj = F05),
    F06 = list(lb = -100, ub = 100, dim = 50, fobj = F06),
    F07 = list(lb = -1.28, ub = 1.28, dim = 50, fobj = F07),
    F08 = list(lb = -500, ub = 500, dim = 50, fobj = F08),
    F09 = list(lb = -5.12, ub = 5.12, dim = 50, fobj = F09),
    F10 = list(lb = -32, ub = 32, dim = 50, fobj = F10),
    F11 = list(lb = -600, ub = 600, dim = 50, fobj = F11),
    F12 = list(lb = -50, ub = 50, dim = 50, fobj = F12),
    F13 = list(lb = -50, ub = 50, dim = 50, fobj = F13),
    F14 = list(lb = -65.536, ub = 65.536, dim = 2, fobj = F14),
    F15 = list(lb = -5, ub = 5, dim = 4, fobj = F15),
    F16 = list(lb = -5, ub = 5, dim = 2, fobj = F16),
    F17 = list(lb = c(-5, 0), ub = c(10, 15), dim = 2, fobj = F17),
    F18 = list(lb = -2, ub = 2, dim = 2, fobj = F18),
    F19 = list(lb = 0, ub = 1, dim = 3, fobj = F19),
    F20 = list(lb = 0, ub = 1, dim = 6, fobj = F20),
    F21 = list(lb = 0, ub = 10, dim = 4, fobj = F21),
    F22 = list(lb = 0, ub = 10, dim = 4, fobj = F22),
    F23 = list(lb = 0, ub = 10, dim = 4, fobj = F23)
  )

  # Check if function exists
  if (!(function_name %in% names(function_details))) {
    stop(paste("Function", function_name, "not found. Available functions are:",
               paste(names(function_details), collapse = ", ")))
  }

  # Return details
  return(function_details[[function_name]])
}
