#' wellPanel_dsfr
#'
#' Crée un panneau avec une bordure légèrement incrustée et un arrière-plan gris et un titre, si on le souhaite.
#'
#' @param ... Éléments d'interface utilisateur à inclure à l'intérieur du panneau.
#' @param title titre du panneau (optionnel)
#' @param grey arrière-plan gris du panneau (FALSE par défaut)
#'
#' @return html
#' @references inspiré de la fonction [shiny::wellPanel()]
#' @family layout functions
#'
#' @importFrom htmltools tagList
#'
#' @examples
#' if (interactive()) {
#'   shiny::shinyApp(
#'     ui = fluidPage_dsfr(
#'       title = "exemple",
#'       fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         wellPanel_dsfr("Ceci est un wellPanel avec titre", title="Mon wellPanel"),
#'         wellPanel_dsfr("Ceci est un wellPanel avec option grey et sans titre", grey = TRUE)
#'       )
#'       )
#'     ),
#'     server = function(input, output) {}
#'   )
#' }
#' @export
wellPanel_dsfr <- function(
    ...,
    title = NULL,
    grey = FALSE
) {
  ui <- wellPanel_dsfr_template(
    title,
    grey = ifelse ( grey, " fr-card--grey", ""),
    content = tagList(
      ...
    )
  )

  ui
}
