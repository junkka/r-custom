context("sp_to_json function")

test_that("create geojson", {

  enviro = environment()
  data(nor2k, package = "rgdal",envir = enviro)
  expect_that(exists("nor2k"), is_true())

  sp_to_json(nor2k, "nor2k")
  expect_that(file.exists("nor2k.geojson"), is_true())
  
  unlink("nor2k.geojson")
})
