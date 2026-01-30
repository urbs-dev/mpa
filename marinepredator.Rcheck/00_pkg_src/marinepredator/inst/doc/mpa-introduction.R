## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)

## ----eval=FALSE---------------------------------------------------------------
# # From GitLab
# remotes::install_github("urbs-dev/marinepredator")

## -----------------------------------------------------------------------------
library(marinepredator)

# Minimize the Sphere function (F01)
result <- mpa(
  SearchAgents_no = 30,   # Number of search agents
  Max_iter = 100,         # Maximum iterations
  lb = -100,              # Lower bound
  ub = 100,               # Upper bound
  dim = 10,               # Number of dimensions
  fobj = F01              # Objective function
)

print(result)

## -----------------------------------------------------------------------------
# Plot the convergence curve
plot(result$Convergence_curve, type = "l", col = "blue", lwd = 2,
     xlab = "Iteration", ylab = "Best Fitness",
     main = "MPA Convergence on Sphere Function")
grid()

## -----------------------------------------------------------------------------
# Get function details programmatically
details <- get_function_details("F09")  # Rastrigin function

# View the details
str(details)

## -----------------------------------------------------------------------------
# Optimize the Rastrigin function
result_rastrigin <- mpa(
  SearchAgents_no = 30,
  Max_iter = 200,
  lb = details$lb,
  ub = details$ub,
  dim = 10,
  fobj = details$fobj
)

print(result_rastrigin)

## -----------------------------------------------------------------------------
# Define a custom function
# Minimum at (1, 2, 3)
custom_fun <- function(x) {
  sum((x - c(1, 2, 3))^2)
}

result_custom <- mpa(
  SearchAgents_no = 20,
  Max_iter = 100,
  lb = c(-10, -10, -10),
  ub = c(10, 10, 10),
  dim = 3,
  fobj = custom_fun
)

cat("Best position found:", round(result_custom$Top_predator_pos, 4), "\n")
cat("Best fitness:", result_custom$Top_predator_fit, "\n")

## -----------------------------------------------------------------------------
# Function to maximize: f(x) = -sum(x^2)
# Maximum is at (0, 0, ..., 0) with value 0

result_max <- mpa(
  SearchAgents_no = 20,
  Max_iter = 100,
  lb = -10, ub = 10,
  dim = 5,
  fobj = function(x) sum(x^2)  # Minimize sum(x^2) = maximize -sum(x^2)
)

cat("Best position:", round(result_max$Top_predator_pos, 6), "\n")
cat("Maximum value:", -result_max$Top_predator_fit, "\n")

## -----------------------------------------------------------------------------
# Compare MPA performance on different functions
set.seed(42)  # For reproducibility

functions <- c("F01", "F05", "F09", "F10")
results <- list()

for (func_name in functions) {
  details <- get_function_details(func_name)
  result <- mpa(
    SearchAgents_no = 30,
    Max_iter = 100,
    lb = details$lb,
    ub = details$ub,
    dim = min(details$dim, 20),  # Limit dimensions for speed
    fobj = details$fobj
  )
  results[[func_name]] <- result$Top_predator_fit
}

# Display results
data.frame(
  Function = names(results),
  Best_Fitness = unlist(results)
)

## ----eval=FALSE---------------------------------------------------------------
# result <- mpa(
#   SearchAgents_no = 30,
#   Max_iter = 100,
#   lb = -100, ub = 100,
#   dim = 10,
#   fobj = F01,
#   logFile = "mpa_log.txt"
# )

