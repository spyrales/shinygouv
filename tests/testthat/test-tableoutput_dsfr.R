# WARNING - Generated by {fusen} from /dev/flat_composants/flat_tableOutput.Rmd: do not edit by hand

test_that("tableOutput_dsfr works", {
  test_html <- tableOutput_dsfr("1")
  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag")
}
)
