test_that("sliderInput_dsfr works", {
  expect_true(inherits(sliderInput_dsfr, "function"))

  test_html <-sliderInput_dsfr( "obs", "Number of observations:",
                                min = 0, max = 1000, value = 500 )

  #' @description tester si shiny.tag pour content
  expect_s3_class(test_html, "shiny.tag")

  ## lecture snapshot
  snapshot_html <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      #"tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "sliderInput_dsfr.Rda")
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
  #                          "sliderInput_dsfr.Rda"
  #                          )
  #         )

  # Pour tester davantage l'objet R vu que le slider Shiny est surtout construit en javascript par ion.rangeSlider.js
  # on test si une modification de ion.rangeSlider.js a eu lieu (ce qui pourrait impacter les styles dsfr de sliderInput_dsfr)
  fpath <- system.file("www/shared/ionrangeslider/js", "ion.rangeSlider.min.js", package="shiny")
  ionrangeslider_js <- readLines(fpath)
  ## lecture snapshot
  snapshot_js <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      #"tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "ionrangeslider_js.Rda")
  )

  #' @description Verifer que le HTML est correct en sortie
  # Retire tous les espaces et saut de ligne pour la comparaison
  # Pour eviter les problèmes inter-OS
  expect_equal(gsub("\\s|\\n", "", ionrangeslider_js),
               gsub("\\s|\\n", "", snapshot_js))

  # Si erreur au précedent test deux cas possible :
  #
  # - nouveau composant: Lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # - composant a mettre a jour: si le test ne passe plus avant de changer le snapshot,
  #  assurez vous d'avoir bien pris en compte la nouvelle personnalisation
  #  dans la fonction footer_dsfr puis lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # saveRDS(ionrangeslider_js,
  #         file = file.path("tests/testthat/snapshot",
  #                          "ionrangeslider_js.Rda"
  #                          )
  #         )
})
