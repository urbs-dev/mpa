# Copyright 2025 Marc Grossouvre
# Licensed under MIT License


# Test test functions
test_that("test functions work correctly", {
  # Test F01 (Sphere function)

  res1_1 <- F01(c(0, 0, 0))
  expect_equal(res1_1, 0)
  expect_equal(F01(c(1, 2, 3)), 1 + 4 + 9)

  # Test F02 (Sum of absolute values and products)
  expect_equal(F02(c(0, 0)), 0)
  expect_equal(F02(c(1, 2)), 1 + 2 + 2)

  # Test F03 (Sum of squared terms)
  expect_equal(F03(c(0, 0, 0)), 0)
  expect_equal(F03(c(1, 2, 3)), 1 + (1 + 2)^2 + (1 + 2 + 3)^2)

  # Test F04 (Maximum absolute value)
  expect_equal(F04(c(0, 0, 0)), 0)
  expect_equal(F04(c(-1, 2, -3)), 3)

  # Test F05 (Rosenbrock function)
  expect_equal(F05(c(1, 1)), 0)

  # Test F06 (Shifted sphere function)
  expect_equal(F06(c(-0.5, -0.5)), 0)

  # Test F07 (Quartic function with noise) - just check it runs
  result <- F07(c(0, 0, 0))
  expect_true(is.numeric(result))

  # Test F08 (Schwefel function)
  expect_equal(F08(c(0, 0)), 0)

  # Test F09 (Rastrigin function)
  expect_equal(F09(c(0, 0)), 0)

  # Test F10 (Ackley function)
  expect_equal(F10(c(0, 0)), 0)

  # Test F11 (Griewank function)
  expect_equal(F11(c(0, 0)), 0)

  # Test F12 (Penalized function 1) - just check it runs
  result <- F12(c(0, 0, 0))
  expect_true(is.numeric(result))

  # Test F13 (Penalized function 2) - just check it runs
  result <- F13(c(0, 0, 0))
  expect_true(is.numeric(result))

  # Test F14 (Shekel's Foxholes) - just check it runs
  result <- F14(c(0, 0))
  expect_true(is.numeric(result))

  # Test F15 (Kowalik function) - just check it runs
  result <- F15(c(0, 0, 0, 0))
  expect_true(is.numeric(result))

  # Test F16 (Six-Hump Camel Back)
  expect_equal(F16(c(0, 0)), 0)

  # Test F17 (Branin function)
  # Note: The expected value is approximate due to the nature of the function
  # Using -pi to get the minimum value within the function's bounds
  expect_true(abs(F17(c(-pi, 12.275)) - 0.397887) < 0.01)

  # Test F18 (Goldstein-Price function)
  expect_equal(F18(c(0, -1)), 3)

  # Test F19 (Hartman 3D function)
  # Note: The expected value is approximate due to the nature of the function
  expect_true(abs(F19(c(0.114614, 0.555649, 0.852547)) - (-3.86278)) < 0.01)

  # Test F20 (Hartman 6D function)
  # Note: The expected value is approximate due to the nature of the function
  expect_true(abs(F20(c(0.20169, 0.150011, 0.476874, 0.275332, 0.311652, 0.6573)) - (-3.32237)) < 0.01)

  # Test F21 (Shekel 5 function) - just check it runs
  result <- F21(c(0, 0, 0, 0))
  expect_true(is.numeric(result))

  # Test F22 (Shekel 7 function) - just check it runs
  result <- F22(c(0, 0, 0, 0))
  expect_true(is.numeric(result))

  # Test F23 (Shekel 10 function) - just check it runs
  result <- F23(c(0, 0, 0, 0))
  expect_true(is.numeric(result))
})
