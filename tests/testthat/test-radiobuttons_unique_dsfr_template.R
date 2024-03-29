# WARNING - Generated by {fusen} from dev/flat_composants/flat_radioButtons.Rmd: do not edit by hand

test_that("radioButtons_unique_dsfr_template works", {
  expect_true(inherits(radioButtons_unique_dsfr_template, "function"))

  htmlfile <- readLines(
    system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "radiobouton.html",
      package = "shinygouv"
    )
  )

  #' @description Comparer les parametres par rapport a ceux de la version precedente

  purrr::walk(
    c(
      "inputId",
      "name",
      "nom_choix",
      "value_choix",
      "inline"
    ),
    function(param) {
      with_moustache <- paste0("\\{\\{", param, "\\}\\}")
      expect_true(any(grepl(pattern = with_moustache, htmlfile)),
        label = paste0("sans moustache '", param, "'"))

    })


  test_html <- radioButtons_unique_dsfr_template(
    inputId = "test-1",
    name = "test",
    choix = c("A"),
    nom_choix = "Choix A",
    inline = TRUE
  )

  #' @description tester si tous les params sont remplaces
  expect_false(
    grepl(
      pattern = "\\{\\{",
      test_html)

  )


  #' @description Verifie que les parametres ont bien ete remplace par leurs valeurs

  purrr::walk(
    c(
      inputId = "test-1",
      name = "test",
      choix = c("A"),
      nom_choix = "Choix A"
    ),
    function(param) {
      expect_true(any(grepl(pattern = param, test_html)),
        label = paste0("remplacement de '", param, "'"))
    })

  ## lecture snapshot
  snapshot_html <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      # "tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "radioButtons_unique_dsfr_template.Rda")
  )

  #' @description Verifie le HTML créé
  # Retire tous les espaces et saut de ligne pour la comparaison
  # Pour eviter les problèmes inter-OS
  expect_equal(
    gsub("\\s|\\n", "", test_html),
    gsub("\\s|\\n", "", snapshot_html)
  )

  # Test "checked"
  test_html_selected <- radioButtons_unique_dsfr_template(
    inputId = "test-1",
    name = "test",
    choix = c("A"),
    nom_choix = "Choix A",
    checked = TRUE
  )

  snapshot_html_selected <- readRDS(
    file = file.path(
      "snapshot", # pour passer les tests en production (apres le inflate),
      # "tests/testthat/snapshot", # pour passer les tests en developpement (avant le inflate),
      "radioButtons_unique_dsfr_template_selected.Rda")
  )

  #' @description Verifie la presence du parametre selected
  # Retire tous les espaces et saut de ligne pour la comparaison
  # Pour eviter les problèmes inter-OS
  expect_equal(
    gsub("\\s|\\n", "", test_html_selected),
    gsub("\\s|\\n", "", snapshot_html_selected)
  )

  # Si erreur au précedent test deux cas possibles :
  #
  # - nouveau composant: Lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # - composant a mettre a jour: si le test ne passe plus avant de changer le snapshot,
  #                              assurez vous d'avoir bien pris en compte la nouvelle personnalisation
  #                              dans la fonction radioButtons_unique_dsfr_template puis lancer le saveRDS, relancer le test et recommenter le saveRDS
  #
  # saveRDS(test_html,
  #   file = file.path("tests/testthat/snapshot",
  #     "radioButtons_unique_dsfr_template.Rda"
  #   )
  # )

  # saveRDS(test_html_selected,
  #         file = file.path("tests/testthat/snapshot",
  #                          "radioButtons_unique_dsfr_template_selected.Rda"
  #                          )
  #         )



})
