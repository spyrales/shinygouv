#' wellPanel_dsfr_template
#' @param domtitle titre de la carte
#' @param greyclass class du container principal
#' @param content body de la carte
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
wellPanel_dsfr_template <- function(
    title,
    grey,
    content
) {
  if ( !is.null(title) ) {
    domtitle <- tags$div(
      class = "fr-card__header fr-px-4w fr-py-2w",
      h3(class = "fr-card__title", title)
    )
  } else {
    domtitle <- ""
  }
  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "wellpanel.html",
      package = "shinygouv"
    ),
    title = domtitle,
    grey = grey,
    content = content
  )
}
