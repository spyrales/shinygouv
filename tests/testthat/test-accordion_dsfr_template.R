test_that("accordion_panel_one works", {
  expect_true(inherits(accordion_panel_one, "function"))

  htmlfile <- readLines(
    system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "accordbody.html",
      package = "shinygouv"
    )
  )

  #' @description Comparer les parametres par rapport a ceux de la version precedente

  purrr::walk(
    c(
      "id",
      "title",
      "content",
      "icon",
      "expand"
    ),
    function(param) {
      with_moustache <- paste0("\\{\\{", param, "\\}\\}")
      expect_true(
        any(grepl(pattern = with_moustache, htmlfile)),
        label = paste0("sans moustache '", param, "'")
      )
    }
  )


  test_html <- accordion_panel_one(
    id = "test",
    title= "Informations",
    content = tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum."),
    icon = "fr-icon-ancient-pavilion-fill",
    num = 1,
    open = 1
  )

  #' @description tester si tous les params sont remplaces
  expect_false(grepl(pattern = "\\{\\{", test_html))


  #' @description Verifie que les parametres ont bien ete remplace par leurs valeurs

  purrr::walk(
    c(
      id = "test",
      title= "Informations",
      content = as.character(tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                     ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                     in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum.")),
      icon = "fr-icon-ancient-pavilion-fill"
    ),
    function(param) {
      expect_true(
        any(grepl(pattern = param, test_html)),
        label = paste0("remplacement de '", param, "'")
      )
    }
  )

})

test_that("accordion_dsfr_template works", {
  expect_true(inherits(accordion_dsfr_template, "function"))

  htmlfile <- readLines(
    system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "accordion.html",
      package = "shinygouv"
    )
  )

  #' @description Comparer les parametres par rapport a ceux de la version precedente

  purrr::walk(
    c(
      "accordionId",
      "extraclass",
      "divs"
    ),
    function(param) {
      with_moustache <- paste0("\\{\\{", param, "\\}\\}")
      expect_true(
        any(grepl(pattern = with_moustache, htmlfile)),
        label = paste0("sans moustache '", param, "'")
      )
    }
  )


  test_html <- accordion_dsfr_template(
    accordionId = " id=\"test\"",
    extraclass= "fr-md-m-3v",
    divs = accordion_panel_one(
        id = "test-1",
        title= "Informations",
        content = tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                       sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                       Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                       ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                       in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                       Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                       officia deserunt mollit anim id est laborum."),
        icon = "fr-icon-ancient-pavilion-fill",
        num = 1,
        open = 1
      )
  )

  #' @description tester si tous les params sont remplaces
  expect_false(grepl(pattern = "\\{\\{", test_html))


  #' @description Verifie que les parametres ont bien ete remplace par leurs valeurs

  purrr::walk(
    c(
      accordionId = " id=\"test\"",
      extraclass= "fr-md-m-3v",
      divs = as.character(accordion_panel_one(
        id = "test-1",
        title= "Informations",
        content = tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                       sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                       Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                       ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                       in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                       Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                       officia deserunt mollit anim id est laborum."),
        icon = "fr-icon-ancient-pavilion-fill",
        num = 1,
        open = 1
      ))
    ),
    function(param) {
      expect_true(
        any(grepl(pattern = param, test_html)),
        label = paste0("remplacement de '", param, "'")
      )
    }
  )

})
