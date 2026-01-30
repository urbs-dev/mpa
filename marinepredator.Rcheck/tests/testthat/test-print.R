# Copyright 2025 Marc Grossouvre
# Licensed under MIT License


# Test print method
test_that("print.mpa_result works correctly", {
  result <- list(
    Top_predator_fit = 0.123456789,
    Top_predator_pos = c(1.23456789, 2.3456789),
    Convergence_curve = rep(0, 10)
  )
  
  # Set class attribute to use S3 print method
  class(result) <- "mpa_result"
  
  # Capture output
  output <- capture.output(print(result))
  
  # Check output contains expected elements
  expect_true(any(grepl("Best fitness", output)))
  expect_true(any(grepl("Best position", output)))
  expect_true(any(grepl("Convergence curve", output)))
})