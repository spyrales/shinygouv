# WARNING - Generated by {fusen} from dev/flat_composants/flat_selectInput.Rmd: do not edit by hand

#' updateSelectInput_dsfr
#'
#' @param inputId id de l'input
#' @param label label du bouton
#' @param choices Liste des valeurs à sélectionner (si les éléments de la liste portent un nom, c'est ce nom qui est affiché à l'utilisateur et non la valeur)
#' @param selected Element selectionné
#' @param session la session, la valeur par défaut est getDefaultReactiveDomain().
#'
#' @importFrom shiny updateSelectInput
#' @return html
#'
#' @export
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'   library(shiny)
#'   library(shinygouv)
#'
#'   ui <- fluidPage_dsfr(
#'     header = header_dsfr(
#'       intitule = "Intitule",
#'       officiel = "Officiel",
#'       nom_site_service = "Nom du site / service",
#'       baseline = "baseline - precisions sur l organisation",
#'       class = "fr-m-1w"
#'     ),
#'     title = "Exemple",
#'     fluidRow_dsfr(
#'       selectInput_dsfr(
#'         inputId = "variable",
#'         label = "Variable:",
#'         choices = c(
#'           "Cylinders" = "cyl",
#'           "Transmission" = "am",
#'           "Gears" = "gear"
#'         )
#'       )
#'     ),
#'     fluidRow_dsfr(
#'       actionButton_dsfr(inputId = "update", label = "update label")
#'     ),
#'     fluidRow_dsfr(
#'       actionButton_dsfr(inputId = "update2", label = "update choices")
#'     ),
#'     fluidRow_dsfr(
#'       actionButton_dsfr(inputId = "update3", label = "update selected")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$update, {
#'       updateSelectInput_dsfr(inputId = "variable", label = "Nouveau label")
#'     })
#'
#'     observeEvent(input$update2, {
#'       updateSelectInput_dsfr(inputId = "variable", choices = LETTERS)
#'     })
#'
#'     observeEvent(input$update3, {
#'       updateSelectInput_dsfr(inputId = "variable", selected = LETTERS[12])
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
updateSelectInput_dsfr <- function(
  inputId,
  label = NULL,
  choices = NULL,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
    ) {
  ns <- session$ns

  updateSelectInput(
    session = session,
    inputId = inputId,
    label = label,
    choices = choices,
    selected = selected
  )
}
