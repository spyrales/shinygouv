test_that("mainPanel_dsfr works", {
  expect_true(inherits(mainPanel_dsfr, "function"))

  test_html <-mainPanel_dsfr(shiny::tags$span("Prefet", br(), "de", br(), "Bretagne"), width = 12)

  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag.list")

})

test_that("sidebarPanel_dsfr works", {
  expect_true(inherits(sidebarPanel_dsfr, "function"))

  test_html <-sidebarPanel_dsfr(shiny::tags$span("Prefet", br(), "de", br(), "Bretagne"), width = 4, title = "Mon test")

  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag.list")

})

test_that("sidebarLayout_dsfr works", {
  test_html <-
    sidebarLayout_dsfr(
      sidebarPanel_dsfr(
        tags$p("Lorem ipsum dolor sit amet."),
        width = 4,
        title = "My sidebar"
      ),
      mainPanel_dsfr(
        tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum.")
      )
    )

  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag.list")

  ## lecture snapshot
  snapshot_html <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      # "tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "sidebarLayout_dsfr.Rda")
  )

  #' @description Verifer que le HTML est correct en sortie
  # Retire tous les espaces et saut de ligne pour la comparaison
  # Pour eviter les problèmes inter-OS
  expect_equal(gsub("\\s|\\n", "", test_html),
               gsub("\\s|\\n", "", snapshot_html))

  # Si erreur au précedent test deux cas possible :
  #
  # - nouveau composant: Lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # - composant a mettre a jour: si le test ne passe plus avant de changer le snapshot,
  #  assurez vous d'avoir bien pris en compte la nouvelle personnalisation
  #  dans la fonction footer_dsfr puis lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # saveRDS(test_html,
  #         file = file.path("tests/testthat/snapshot",
  #                          "sidebarLayout_dsfr.Rda"
  #                          )
  #         )

})
