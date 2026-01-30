# Copyright 2025 Marc Grossouvre
# Licensed under MIT License

# Test get_function_details function
test_that("get_function_details works correctly", {
  # Test known function
  details <- get_function_details("F01")
  expect_equal(details$lb, -100)
  expect_equal(details$ub, 100)
  expect_equal(details$dim, 50)
  expect_equal(class(details$fobj), "function")

  # Test function with vector bounds
  details <- get_function_details("F17")
  expect_equal(details$lb, c(-5, 0))
  expect_equal(details$ub, c(10, 15))
  expect_equal(details$dim, 2)

  # Test error handling
  expect_error(get_function_details("F99"))
})
