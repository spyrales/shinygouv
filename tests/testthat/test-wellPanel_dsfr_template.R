test_that("wellPanel_dsfr_template works", {
  expect_true(inherits(wellPanel_dsfr_template, "function"))

  htmlfile <- readLines(
    system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "wellpanel.html",
      package = "shinygouv"
    )
  )

  #' @description Comparer les parametres par rapport a ceux de la version precedente

  purrr::walk(
    c(
      "title",
      "grey",
      "content"
    ),
    function(param) {
      with_moustache <- paste0("\\{\\{", param, "\\}\\}")
      expect_true(
        any(grepl(pattern = with_moustache, htmlfile)),
        label = paste0("sans moustache '", param, "'")
      )
    }
  )


  test_html <- wellPanel_dsfr_template(
    title = "Informations",
    grey = " fr-card--grey",
    content = tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum.")
  )

  #' @description tester si tous les params sont remplaces
  expect_false(grepl(pattern = "\\{\\{", test_html))


  #' @description Verifie que les parametres ont bien ete remplace par leurs valeurs

  purrr::walk(
    c(
      title = "Informations",
      grey = " fr-card--grey",
      content = as.character(tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum."))
    ),
    function(param) {
      expect_true(
        any(grepl(pattern = param, test_html)),
        label = paste0("remplacement de '", param, "'")
      )
    }
  )
})

