#' fluidPage_dsfr_template
#' @param header entete de la page
#' @param title titre de la page
#' @param body body
#' @param footer footer de la page
#' @param class class du container principal
#' @param dependencies fixe les dépendances complémentaires (js, css) via 
#'  une div vide. NULL par défault 
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
fluidPage_dsfr_template <- function(
  header,
  title,
  body,
  footer = NULL,
  class = "fr-container",
  dependencies = NULL
    ) {
  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "fluidpage.html",
      package = "shinygouv"
    ),
	dependencies = dependencies,
	skiplinks = skiplinks_template(),
    header = header,
    title = title,
    body = tags$div(
      class = class,
      body
    ),
    footer = footer,
	spinner = addWithSpinner(),
	modal = modaltheme_template()
  )
}
