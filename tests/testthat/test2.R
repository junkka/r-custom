context("anonymize id")

test_that('anonymize_id function', {
  
  test_data <- c('e','b','c','d','f','g','e')
  test_data_2 <- c(21:26,21)
  
  results_data <- c(1,2,3,4,5,6,1)
  
  expect_that(anonymize_id(test_data), equals(results_data))
  expect_that(anonymize_id(test_data_2), equals(results_data))
  
  test_data_3 <- c(20,20,5,1,3,5)
  res_3 <- c(1,1,2,3,4,2)
  
  expect_that(anonymize_id(test_data_3), equals(res_3))
})