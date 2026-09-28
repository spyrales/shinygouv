test_that("wellPanel_dsfr works", {
  expect_true(inherits(wellPanel_dsfr, "function"))
  test_html <- wellPanel_dsfr("Ceci est un wellPanel avec titre", title="Mon wellPanel")
  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag.list")
})
