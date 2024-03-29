# WARNING - Generated by {fusen} from dev/flat_composants/flat_checkBoxInput.Rmd: do not edit by hand

test_that("checkboxInput_dsfr works", {
  test_html <- checkboxInput_dsfr(
    inputId = 'test', label = 'test', value = FALSE)
  
  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag")
  
  
  ## lecture snapshot
  snapshot_html <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      # "tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "checkboxInput_dsfr.Rda")
  )
  
  #' @description Verifie le HTML créé
  expect_equal(gsub("\\s|\\n", "", test_html),
               gsub("\\s|\\n", "", snapshot_html))
  
  # Si erreur au précedent test deux cas possible :
  #
  # - nouveau composant: Lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # - composant a mettre a jour: si le test ne passe plus avant de changer le snapshot,
  #                              assurez vous d'avoir bien pris en compte la nouvelle personnalisation
  #                              dans la fonction checkboxInput_dsfr_template puis lancer le saveRDS, relancer le test et recommenter le saveRDS
  # saveRDS(test_html,
  #         file = file.path("tests/testthat/snapshot",
  #                          "checkboxInput_dsfr.Rda"
  #                          )
  #         )
  
})
#
test_that("checkboxInput_dsfr", {
  test <- checkboxInput_dsfr(
    inputId = 'test', label = 'test', value = FALSE)
  
  #' @description tester si shiny.tag
  expect_s3_class(test, "shiny.tag")
  
  expect_error(
    checkboxInput_dsfr(inputId = "test", label = 'test', value = "char")
  )
  
  expect_error(
    checkboxInput_dsfr(inputId = 'test', label = 11, value = FALSE)
  )
  
  expect_error(
    checkboxInput_dsfr(inputId = 11, label = 'test', value = FALSE)
  )
})
