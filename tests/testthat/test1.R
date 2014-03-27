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
