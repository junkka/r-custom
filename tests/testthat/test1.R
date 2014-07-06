context("nas function")

test_that("nas work", {
  set.seed(4)
  data <- c(rnorm(100,2), rep(NA,22))
  result <- data.frame(
    Var1 = c("FALSE", "TRUE"), 
    Freq = c(100, 22),
    Prop = c(81.967, 18.033)
  )
  expect_that(nas(data), equals(result))
})

test_that('nas_c', {
  test_data <- data.frame(
    'a' = c(1:180, rep(NA, 20)), 
    'b' = c(1:160, rep(NA, 40)), 
    'c' = c(1:200)
  )
  result <- data.frame(
    '.id' = c("a", "b", "c"),
    'V1'  = c("10", "20", "Non"),
    stringsAsFactors = FALSE
  )
  expect_that(nas_c(test_data), equals(result))
})