pkgname <- "marinepredator"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "marinepredator-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('marinepredator')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("F01")
### * F01

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F01
### Title: Sphere Function (F01)
### Aliases: F01

### ** Examples

F01(c(0, 0, 0))    # Returns 0 (global minimum)
F01(c(1, 2, 3))    # Returns 1 + 4 + 9 = 14
F01(rep(0, 50))    # Returns 0 in 50 dimensions




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F01", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F02")
### * F02

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F02
### Title: Sum of Absolute Values and Products (F02)
### Aliases: F02

### ** Examples

F02(c(0, 0))      # Returns 0 (global minimum)
F02(c(1, 2))      # Returns |1| + |2| + |1|*|2| = 1 + 2 + 2 = 5
F02(c(-1, -2))    # Returns 1 + 2 + 2 = 5




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F02", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F03")
### * F03

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F03
### Title: Sum of Squared Cumulative Sums (F03)
### Aliases: F03

### ** Examples

F03(c(0, 0, 0))    # Returns 0 (global minimum)
F03(c(1, 2, 3))    # Returns 1^2 + (1+2)^2 + (1+2+3)^2 = 1 + 9 + 36 = 46




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F03", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F04")
### * F04

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F04
### Title: Maximum Absolute Value (F04)
### Aliases: F04

### ** Examples

F04(c(0, 0, 0))    # Returns 0 (global minimum)
F04(c(-1, 2, -3))  # Returns 3
F04(c(5, -5, 5))   # Returns 5




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F04", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F05")
### * F05

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F05
### Title: Rosenbrock Function (F05)
### Aliases: F05

### ** Examples

F05(c(1, 1))       # Returns 0 (global minimum)
F05(c(0, 0))       # Returns 1
F05(c(1, 1, 1, 1)) # Returns 0 (global minimum in 4D)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F05", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F06")
### * F06

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F06
### Title: Step Function / Shifted Sphere (F06)
### Aliases: F06

### ** Examples

F06(c(-0.5, -0.5))       # Returns 0 (global minimum)
F06(c(0, 0))             # Returns 0.5
F06(rep(-0.5, 50))       # Returns 0 in 50 dimensions




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F06", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F07")
### * F07

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F07
### Title: Quartic Function with Noise (F07)
### Aliases: F07

### ** Examples

F07(c(0, 0, 0))  # Returns a value close to 0 (with some noise)
# Multiple calls may return different values due to noise:
replicate(5, F07(c(0, 0, 0)))




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F07", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F08")
### * F08

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F08
### Title: Schwefel Function (F08)
### Aliases: F08

### ** Examples

F08(c(420.9687, 420.9687))  # Returns approximately -837.97 (near global minimum)
F08(c(0, 0))                # Returns 0




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F08", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F09")
### * F09

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F09
### Title: Rastrigin Function (F09)
### Aliases: F09

### ** Examples

F09(c(0, 0))    # Returns 0 (global minimum)
F09(c(1, 1))    # Returns approximately 2
F09(rep(0, 10)) # Returns 0 in 10 dimensions




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F09", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F10")
### * F10

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F10
### Title: Ackley Function (F10)
### Aliases: F10

### ** Examples

F10(c(0, 0))  # Returns approximately 0 (global minimum)
F10(c(1, 1))  # Returns approximately 3.6




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F10", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F11")
### * F11

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F11
### Title: Griewank Function (F11)
### Aliases: F11

### ** Examples

F11(c(0, 0))  # Returns 0 (global minimum)
F11(c(1, 1))  # Returns approximately 0.007




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F11", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F12")
### * F12

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F12
### Title: Penalized Function 1 (F12)
### Aliases: F12

### ** Examples

F12(c(-1, -1, -1))  # Returns approximately 0 (near global minimum)
F12(c(0, 0, 0))     # Returns a small positive value




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F12", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F13")
### * F13

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F13
### Title: Penalized Function 2 (F13)
### Aliases: F13

### ** Examples

F13(c(1, 1, 1))  # Returns approximately 0 (near global minimum)
F13(c(0, 0, 0))  # Returns a small positive value




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F13", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F14")
### * F14

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F14
### Title: Shekel's Foxholes Function (F14)
### Aliases: F14

### ** Examples

F14(c(-32, -32))  # Returns approximately 0.998 (global minimum)
F14(c(0, 0))      # Returns approximately 10




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F14", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F15")
### * F15

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F15
### Title: Kowalik Function (F15)
### Aliases: F15

### ** Examples

F15(c(0.1928, 0.1908, 0.1231, 0.1358))  # Returns approximately 0.0003
F15(c(0, 0, 0, 0))  # Returns a larger value




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F15", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F16")
### * F16

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F16
### Title: Six-Hump Camel Back Function (F16)
### Aliases: F16

### ** Examples

F16(c(0.0898, -0.7126))   # Returns approximately -1.0316 (global minimum)
F16(c(-0.0898, 0.7126))   # Returns approximately -1.0316 (global minimum)
F16(c(0, 0))              # Returns 0




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F16", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F17")
### * F17

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F17
### Title: Branin Function (F17)
### Aliases: F17

### ** Examples

F17(c(-pi, 12.275))      # Returns approximately 0.398 (global minimum)
F17(c(pi, 2.275))        # Returns approximately 0.398 (global minimum)
F17(c(9.42478, 2.475))   # Returns approximately 0.398 (global minimum)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F17", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F18")
### * F18

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F18
### Title: Goldstein-Price Function (F18)
### Aliases: F18

### ** Examples

F18(c(0, -1))  # Returns 3 (global minimum)
F18(c(0, 0))   # Returns 600




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F18", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F19")
### * F19

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F19
### Title: Hartmann 3D Function (F19)
### Aliases: F19

### ** Examples

F19(c(0.114614, 0.555649, 0.852547))  # Returns approximately -3.86278
F19(c(0.5, 0.5, 0.5))  # Returns a value > -3.86




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F19", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F20")
### * F20

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F20
### Title: Hartmann 6D Function (F20)
### Aliases: F20

### ** Examples

F20(c(0.20169, 0.150011, 0.476874, 0.275332, 0.311652, 0.6573))
# Returns approximately -3.32237




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F20", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F21")
### * F21

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F21
### Title: Shekel 5 Function (F21)
### Aliases: F21

### ** Examples

F21(c(4, 4, 4, 4))  # Returns approximately -10.15 (near global minimum)
F21(c(0, 0, 0, 0))  # Returns a value close to 0




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F21", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F22")
### * F22

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F22
### Title: Shekel 7 Function (F22)
### Aliases: F22

### ** Examples

F22(c(4, 4, 4, 4))  # Returns approximately -10.40 (near global minimum)
F22(c(0, 0, 0, 0))  # Returns a value close to 0




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F22", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("F23")
### * F23

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: F23
### Title: Shekel 10 Function (F23)
### Aliases: F23

### ** Examples

F23(c(4, 4, 4, 4))  # Returns approximately -10.54 (near global minimum)
F23(c(0, 0, 0, 0))  # Returns a value close to 0




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("F23", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("get_function_details")
### * get_function_details

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: get_function_details
### Title: Get Function Details
### Aliases: get_function_details

### ** Examples

# Get details for the Sphere function (F01)
details <- get_function_details("F01")
str(details)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("get_function_details", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("initialize_population")
### * initialize_population

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: initialize_population
### Title: Initialize Population
### Aliases: initialize_population

### ** Examples

# Initialize a population of 25 agents in 30 dimensions with bounds [-100, 100]
population <- initialize_population(25, 30, 100, -100)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("initialize_population", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("levy")
### * levy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: levy
### Title: Levy Flight Random Step Generator
### Aliases: levy

### ** Examples

# Generate 10 Levy flight steps in 2 dimensions with beta = 1.5
steps <- levy(10, 2, 1.5)
dim(steps)  # 10 x 2

# Visualize the distribution of Levy steps
steps_1d <- levy(1000, 1, 1.5)
hist(steps_1d, breaks = 50, main = "Levy Flight Distribution")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("levy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("mpa")
### * mpa

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: mpa
### Title: Marine Predators Algorithm (MPA)
### Aliases: mpa

### ** Examples

# Basic usage with the Sphere function (F01)
result <- mpa(
  SearchAgents_no = 25, Max_iter = 100, lb = -100, ub = 100,
  dim = 30, fobj = F01
)
print(result)

# Using different bounds per dimension
result2 <- mpa(
  SearchAgents_no = 20, Max_iter = 50,
  lb = c(-5, 0), ub = c(10, 15),
  dim = 2, fobj = F17
)

# Maximization example (negate the objective function)
maximize_f <- function(x) -sum(x^2)
result3 <- mpa(
  SearchAgents_no = 20, Max_iter = 50,
  lb = -10, ub = 10, dim = 5,
  fobj = function(x) -maximize_f(x)
)
# The actual maximum value is -result3$Top_predator_fit




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("mpa", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("print.mpa_result")
### * print.mpa_result

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: print.mpa_result
### Title: Print method for MPA results
### Aliases: print.mpa_result

### ** Examples

result <- mpa(SearchAgents_no = 10, Max_iter = 20, lb = -10, ub = 10,
              dim = 5, fobj = F01)
print(result)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("print.mpa_result", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("test-functions")
### * test-functions

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: test-functions
### Title: Test Functions for Optimization
### Aliases: test-functions
### Keywords: benchmark optimization testing

### ** Examples

# Get details for a specific function
details <- get_function_details("F01")

# Use a test function directly
F01(c(0, 0, 0))  # Returns 0 (global minimum)

# List all available test functions
available_functions <- c("F01", "F02", "F03", "F04", "F05", "F06", "F07", "F08", "F09", "F10",
                       "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20",
                       "F21", "F22", "F23")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("test-functions", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
