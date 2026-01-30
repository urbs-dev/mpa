# Marine Predators Algorithm in R (mpa)

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
![Code Coverage](https://img.shields.io/badge/coverage-100.0%25-brightgreen.svg)
<!-- coverage: end -->


**mpa** is an R implementation of the Marine Predators Algorithm (MPA), a nature-inspired metaheuristic optimization algorithm. This package provides a complete implementation of the MPA algorithm as described in the original paper by Faramarzi et al. (2020).

**Documentation**: []()

## Installation

You can install the development version of mpa from GitHub:

```r
# Install remotes if not already installed
if (!require("remotes")) {
  install.packages("remotes")
}

# Install marinepredator
remotes::install_github(repo = "urbs-dev/marinepredator")
```

## Overview

The Marine Predators Algorithm (MPA) is inspired by the foraging behavior of marine predators and their interactions with prey. The algorithm follows these key principles:

1. **Lévy and Brownian Movement**: Marine predators use Lévy strategy for environments with low prey concentration and Brownian movement for areas with abundant prey.

2. **Velocity Ratios**: The algorithm considers different velocity ratios between predators and prey:
   - High velocity ratio (prey moves faster)
   - Unit velocity ratio (similar speeds)
   - Low velocity ratio (predator moves faster)

3. **Memory**: Predators remember successful foraging locations and their associates.

4. **Environmental Effects**: The algorithm models natural phenomena like eddy formation and FADs (Fish Aggregating Devices).

## Usage

### Basic Example

```r
library(marinepredator)

# Optimize the Sphere function (F01)
result <- mpa(
  SearchAgents_no = 25,    # Number of search agents
  Max_iter = 100,          # Maximum iterations
  lb = -100,               # Lower bound
  ub = 100,                # Upper bound
  dim = 30,                # Number of dimensions
  fobj = F01               # Objective function
)

# Print results
print(result)
```

### Using Benchmark Functions

The package includes 23 standard benchmark functions:

```r
# Get function details
details <- get_function_details("F01")  # Sphere function

# Run optimization
result <- mpa(
  SearchAgents_no = 25,
  Max_iter = 100,
  lb = details$lb,
  ub = details$ub,
  dim = details$dim,
  fobj = details$fobj
)
```

### Custom Functions

You can use MPA with your own objective functions:

```r
# Define a custom function
custom_function <- function(x) {
  return(sum((x - c(1, 2, 3))^2))  # Minimum at (1, 2, 3)
}

# Run optimization
result <- mpa(
  SearchAgents_no = 20,
  Max_iter = 50,
  lb = c(-10, -10, -10),
  ub = c(10, 10, 10),
  dim = 3,
  fobj = custom_function
)
```

## Available Functions

### Main Algorithm
- `mpa()`: Main Marine Predators Algorithm implementation
- `print.mpa_result()`: Print method for MPA results

### Helper Functions
- `initialize_population()`: Initialize the search agent population
- `levy()`: Generate Lévy flight random steps
- `get_function_details()`: Get details for benchmark functions

### Benchmark Functions (F01-F23)
- `F01()`: Sphere function
- `F02()`: Sum of absolute values and products
- `F03()`: Sum of squared terms
- `F04()`: Maximum absolute value
- `F05()`: Rosenbrock function
- `F06()`: Shifted sphere function
- `F07()`: Quartic function with noise
- `F08()`: Schwefel function
- `F09()`: Rastrigin function
- `F10()`: Ackley function
- `F11()`: Griewank function
- `F12()`: Penalized function 1
- `F13()`: Penalized function 2
- `F14()`: Shekel's Foxholes
- `F15()`: Kowalik function
- `F16()`: Six-Hump Camel Back
- `F17()`: Branin function
- `F18()`: Goldstein-Price function
- `F19()`: Hartman 3D function
- `F20()`: Hartman 6D function
- `F21()`: Shekel 5 function
- `F22()`: Shekel 7 function
- `F23()`: Shekel 10 function

## Demo

See the `demo/` directory for complete usage examples:

- `mpaBenchmark.R`: Comprehensive examples of using MPA with benchmark functions

## Algorithm Parameters

The MPA algorithm has several key parameters:

- `SearchAgents_no`: Number of search agents (predators) in the population
- `Max_iter`: Maximum number of iterations
- `FADs`: Fish Aggregating Devices parameter (default: 0.2)
- `P`: Prey movement probability (default: 0.5)

## Performance

The algorithm's performance can be evaluated using the convergence curve:

```r
# Plot convergence curve
plot(result$Convergence_curve, type = "l", col = "blue", lwd = 2,
     main = "MPA Convergence Curve",
     xlab = "Iteration", ylab = "Best Fitness")
grid()
```

## References

Faramarzi, A., Heidarinejad, M., Mirjalili, S., & Gandomi, A. H. (2020). Marine Predators Algorithm: A Nature-inspired Metaheuristic. Expert Systems with Applications, 113377. DOI: 10.1016/j.eswa.2020.113377

## License

This package is licensed under the MIT License.

## Acknowledgments

Original MATLAB implementation by Afshin Faramarzi and Seyedali Mirjalili

Note that I have use generative AI to produce the initial translation of the MATLAB code into R. For this, I have used Vibe from Mistral AI (Devstral). In a second phase, I have checked the code manually and produced unit tests. In a third phase, I have use Claude code AI to reinforce documentation, especially for a general presentation of test functions.

## Support

For issues, questions, or contributions, please open an issue on the [GitHub repository](https://github.com/urbs-dev/marinepredator).

## Citation

If you use this package in your research, please cite the original paper:

```
@article{faramarzi2020marine,
  title={Marine Predators Algorithm: A Nature-inspired Metaheuristic},
  author={Faramarzi, Afshin and Heidarinejad, Mohammad and Mirjalili, Seyedali and Gandomi, Amir H},
  journal={Expert Systems with Applications},
  volume={113377},
  year={2020},
  publisher={Elsevier}
}
```
