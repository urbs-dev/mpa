# Copyright 2025 Marc Grossouvre
# Licensed under MIT License

# Test initialization function
test_that("initialize_population works correctly", {
  # Test with scalar bounds
  pop <- initialize_population(10, 5, 100, -100)
  expect_equal(nrow(pop), 10)
  expect_equal(ncol(pop), 5)
  expect_true(all(pop >= -100 & pop <= 100))
  
  # Test with vector bounds
  lb <- c(-10, -20, -30)
  ub <- c(10, 20, 30)
  pop <- initialize_population(5, 3, ub, lb)
  expect_equal(nrow(pop), 5)
  expect_equal(ncol(pop), 3)
  expect_true(all(pop[, 1] >= -10 & pop[, 1] <= 10))
  expect_true(all(pop[, 2] >= -20 & pop[, 2] <= 20))
  expect_true(all(pop[, 3] >= -30 & pop[, 3] <= 30))
  
  # Test error handling
  expect_error(initialize_population(10, 5, c(100, 200), -100))
})