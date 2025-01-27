test_that("updateNavlistPanel_dsfr works", {
  expect_true(inherits(updateNavlistPanel_dsfr, "function"))

  sessA <- createModuleSession("modA")

  expect_error(
    updateNavlistPanel_dsfr(
      session = sessA,
      inputId = "myid",
      selected = NULL
    ),
    regexp = "Vous devez sp\u00e9cifier"
  )
})

