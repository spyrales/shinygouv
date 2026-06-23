#' fluidPage_dsfr
#'
#' @param ... element a inclure dans la page
#' @param header l entete de la page (voir `header_dsfr()`)
#' @param footer contenu du pied de page (voir `footer_dsfr()`)
#' @param theme pas implemente
#' @param lang pas implemente
#' @param title titre de la page
#' @param dependencies dépendences complémentaire à implémenter 
#'  dans la balise head (exemple golem add_resource_path ou htmlDependency).
#'  NULL par défaut
#'
#' @return html
#' @references inspiré de la fonction [shiny::fluidPage()]
#' @family structure functions
#'
#' @importFrom htmltools tagList
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#'   library(shiny)
#'   my_page <- fluidPage_dsfr(
#'     header = header_dsfr(
#'       intitule = c("Prefet", "de", "Bretagne")
#'     ),
#'     title = "Gouv",
#'     htmltools::div("test")
#'   )
#'
#'   shiny::shinyApp(
#'     my_page,
#'     server = function(input, output) {}
#'   )
#' }
fluidPage_dsfr <- function(
  ...,
  header = NULL,
  title = NULL,
  footer = NULL,
  theme = NULL,
  lang = NULL,
  dependencies = NULL
    ) {
  # TODO theme et lang
  # check les params
  ui <- fluidPage_dsfr_template(
    dependencies = tagList(add_dsfr_deps(),dependencies),
    header = tagList(header),
    title = tagList(title),
    body = tagList(
      ...
    ),
    footer = footer
  )

  ui
}
