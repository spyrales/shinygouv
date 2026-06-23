#' choix_theme_template
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
choix_theme_template <- function(headfoot = 'head') {

  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      paste0("btn_",headfoot,"_choix_theme.html"),
      package = "shinygouv"
    )
  )
}
