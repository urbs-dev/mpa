library(mpa)
#' Example Usage of Marine Predators Algorithm (MPA) in R
#'
#' This script demonstrates how to use the mpa package to optimize 
#' benchmark functions using the Marine Predators Algorithm.
#'
#' @author Marc Grossouvre
#' @date 2025-12-29

# Load the package
library(mpa)

# Example 1: Optimize the Sphere function (F01)
cat("Example 1: Optimizing Sphere function (F01)\n")
cat("============================================\n")

# Get function details
details <- get_function_details("F01")
cat(sprintf("Function: F01 (Sphere)\n"))
cat(sprintf("Dimensions: %d\n", details$dim))
cat(sprintf("Bounds: [%f, %f]\n", details$lb, details$ub))

# Run MPA optimization
set.seed(123)  # For reproducibility
result <- mpa(
  SearchAgents_no = 25,
  Max_iter = 100,
  lb = details$lb,
  ub = details$ub,
  dim = details$dim,
  fobj = details$fobj
)

# Print results
print(result)
cat(sprintf("\nFinal best fitness: %.10f\n", result$Top_predator_fit))
cat(sprintf("Best position: %s\n", paste(round(result$Top_predator_pos, 6), collapse = " ")))

cat("\n")

# Example 2: Optimize the Rosenbrock function (F05)
cat("Example 2: Optimizing Rosenbrock function (F05)\n")
cat("================================================\n")

# Get function details
details <- get_function_details("F05")
cat(sprintf("Function: F05 (Rosenbrock)\n"))
cat(sprintf("Dimensions: %d\n", details$dim))
cat(sprintf("Bounds: [%f, %f]\n", details$lb, details$ub))

# Run MPA optimization
set.seed(123)  # For reproducibility
result <- mpa(
  SearchAgents_no = 25,
  Max_iter = 100,
  lb = details$lb,
  ub = details$ub,
  dim = details$dim,
  fobj = details$fobj
)

# Print results
print(result)
cat(sprintf("\nFinal best fitness: %.10f\n", result$Top_predator_fit))
cat(sprintf("Best position: %s\n", paste(round(result$Top_predator_pos, 6), collapse = " ")))

cat("\n")

# Example 3: Optimize a custom function
cat("Example 3: Optimizing a custom function\n")
cat("========================================\n")

# Define a custom function (e.g., simple quadratic)
custom_function <- function(x) {
  return(sum((x - c(1, 2, 3))^2))  # Minimum at (1, 2, 3)
}

cat("Custom function: sum((x - c(1, 2, 3))^2)\n")
cat("Minimum should be at (1, 2, 3) with value 0\n")

# Run MPA optimization
set.seed(123)  # For reproducibility
result <- mpa(
  SearchAgents_no = 20,
  Max_iter = 50,
  lb = c(-10, -10, -10),
  ub = c(10, 10, 10),
  dim = 3,
  fobj = custom_function
)

# Print results
print(result)
cat(sprintf("\nFinal best fitness: %.10f\n", result$Top_predator_fit))
cat(sprintf("Best position: %s\n", paste(round(result$Top_predator_pos, 6), collapse = " ")))
cat(sprintf("Expected position: 1.000000 2.000000 3.000000\n"))

cat("\n")

# Example 4: Plot convergence curve
cat("Example 4: Plotting convergence curve\n")
cat("======================================\n")

# Run MPA on a simple function
set.seed(123)
result <- mpa(
  SearchAgents_no = 15,
  Max_iter = 30,
  lb = -5,
  ub = 5,
  dim = 2,
  fobj = F01  # Sphere function
)

# Plot convergence curve
plot(result$Convergence_curve, type = "l", col = "blue", lwd = 2,
     main = "MPA Convergence Curve",
     xlab = "Iteration", ylab = "Best Fitness",
     ylim = c(0, max(result$Convergence_curve)))
grid()

cat(sprintf("\nConvergence curve plotted for %d iterations\n", length(result$Convergence_curve)))
cat(sprintf("Final fitness: %.6f\n", result$Top_predator_fit))

cat("\nAll examples completed!\n")
