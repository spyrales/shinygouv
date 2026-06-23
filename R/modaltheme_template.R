#' modaltheme_template
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
modaltheme_template <- function() {

  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "modaltheme.html",
      package = "shinygouv"
    )
  )
}
