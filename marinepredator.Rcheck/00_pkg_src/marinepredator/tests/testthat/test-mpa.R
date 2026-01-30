# Copyright 2025 Marc Grossouvre
# Licensed under MIT License


# Test MPA algorithm
test_that("MPA algorithm works correctly", {
  # Test with simple function (Sphere)
  result <- mpa(
    SearchAgents_no = 10,
    Max_iter = 10,
    lb = -10,
    ub = 10,
    dim = 2,
    fobj = F01
  )

  # Check result structure
  expect_s3_class(result, "list")
  expect_equal(names(result), c("Top_predator_fit", "Top_predator_pos", "Convergence_curve"))
  expect_equal(length(result$Convergence_curve), 10)
  expect_equal(length(result$Top_predator_pos), 2)

  # Check that fitness is reasonable (should be close to 0 for sphere function)
  expect_true(result$Top_predator_fit >= 0)

  # Test with another function (Rosenbrock)
  result <- mpa(
    SearchAgents_no = 10,
    Max_iter = 10,
    lb = -5,
    ub = 5,
    dim = 2,
    fobj = F05
  )

  # Check result structure
  expect_s3_class(result, "list")
  expect_equal(names(result), c("Top_predator_fit", "Top_predator_pos", "Convergence_curve"))
  expect_equal(length(result$Convergence_curve), 10)
  expect_equal(length(result$Top_predator_pos), 2)

  # Check that fitness is reasonable (should be close to 0 for Rosenbrock)
  expect_true(result$Top_predator_fit >= 0)
})


test_that("MPA algorithm works correctly with log", {
  logFile <- tempfile(pattern = "logMPA", fileext = ".txt")

  # Test with simple function (Sphere)
  result <- mpa(
    SearchAgents_no = 10,
    Max_iter = 10,
    lb = -10,
    ub = 10,
    dim = 2,
    fobj = F01,
    logFile = logFile
  )

  res <- readLines(logFile)

  expect_length(object = res, n = 10)
})
