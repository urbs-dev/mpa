# Copyright 2025 Marc Grossouvre
# Licensed under MIT License


# Test levy function
test_that("levy function works correctly", {
  # Test basic functionality
  steps <- levy(10, 2, 1.5)
  expect_equal(nrow(steps), 10)
  expect_equal(ncol(steps), 2)
  
  # Test beta validation
  expect_error(levy(10, 2, 0.5))
  expect_error(levy(10, 2, 2.5))
  
  # Test that steps are not all zero
  expect_true(any(steps != 0))
})