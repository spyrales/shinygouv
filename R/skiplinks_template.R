#' skiplinks_template
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
skiplinks_template <- function() {

  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "skiplinks.html",
      package = "shinygouv"
    )
  )
}
