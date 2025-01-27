test_that("accordion_panel_dsfr works", {
  expect_true(inherits(accordion_panel_dsfr, "function"))

  test_html <-accordion_panel_dsfr( title = "Un accordeon", content = shiny::tagList(shiny::tags$span("Prefet", br(), "de", br(), "Bretagne")), icon = "fr-icon-ancient-pavilion-fill")

  #' @description tester si shiny.tag pour content
  expect_s3_class(test_html$content, "shiny.tag.list")

})

test_that("accordion_dsfr works", {
  test_html <-
    accordion_dsfr(
      id = "test",
      accordion_panel_dsfr(
        title = "Un premier accordeon",
        content = tagList(
          h3("Coucou"),
          p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum.")
        ),
        icon = "fr-icon-ancient-pavilion-fill"
      ),
      accordion_panel_dsfr(
        title = "Un deuxieme accordeon",
        content = tagList(
          h3("Salut"),
          p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum.")
        ),
        icon = "fr-icon-ancient-pavilion-fill"
      )
    )

  #' @description tester si shiny.tag
  expect_s3_class(test_html, "shiny.tag.list")

  ## lecture snapshot
  snapshot_html <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      # "tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "accordion_dsfr.Rda")
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
  #                          "accordion_dsfr.Rda"
  #                          )
  #         )
})

test_that("accordion_panel_open_dsfr works", {
  expect_true(inherits(accordion_panel_open_dsfr, "function"))

  sessA <- createModuleSession("modA")

  expect_error(
    accordion_panel_open_dsfr(
      session = sessA,
      inputId = "myid",
      selected = NULL
    ),
    regexp = "Vous devez sp\u00e9cifier"
  )
})

test_that("accordion_panel_close_dsfr works", {
  expect_true(inherits(accordion_panel_close_dsfr, "function"))

})
