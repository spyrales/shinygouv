test_that("navlistPanel_dsfr_template works", {
  expect_true(inherits(navlistPanel_dsfr_template, "function"))

  htmlfile <- readLines(
    system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "navlistPanel.html",
      package = "shinygouv"
    )
  )

  #' @description Comparer les parametres par rapport a ceux de la version precedente

  purrr::walk(
    c(
      "navlistPanelId",
      "li",
      "divs",
      "title",
      "widths\\[1\\]",
      "widths\\[2\\]"
    ),
    function(param) {
      with_moustache <- paste0("\\{\\{", param, "\\}\\}")
      expect_true(
        any(grepl(pattern = with_moustache, htmlfile)),
        label = paste0("sans moustache \'", param, "\'")
      )
    }
  )


  test_html <- navlistPanel_dsfr_template(
    navlistPanelId = "test",
    title= "Mon test",
    widths = c(3,9),
    li = listpanel_one_li(
      "tab-1",
      "Tab 1"
    ),
    divs = listpanel_one_body(
      "tab-1",
      "Tab 1"
    )
  )


  #' @description tester si tous les params sont remplaces
  expect_false(grepl(pattern = "\\{\\{", test_html))

  #' @description Verifie que les parametres ont bien ete remplace par leurs valeurs

  purrr::walk(
    c(
      navlistPanelId = "test",
      title= "Mon test",
      widths = c(3,9),
      li = as.character(listpanel_one_li(
        "tab-1",
        "Tab 1"
      )),
      divs = as.character(listpanel_one_body(
        "tab-1",
        "Tab 1"
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
