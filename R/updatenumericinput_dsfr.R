# WARNING - Generated by {fusen} from /dev/flat_composants/flat_numericInput.Rmd: do not edit by hand

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
#'       numericInput_dsfr(
#'         inputId = "mynumericinput",
#'         label = "Numeric input",
#'         value = 12,
#'         min = 0,
#'         max = NA,
#'         step = 2
#'       ),
#'       actionButton_dsfr(
#'         inputId = "updateLabel",
#'         label = "updateLabel"
#'       ),
#'       actionButton_dsfr(
#'         inputId = "updateValue",
#'         label = "updateValue"
#'       ),
#'       actionButton_dsfr(
#'         inputId = "updateMin",
#'         label = "updateMin à la valeur en cours"
#'       ),
#'       actionButton_dsfr(
#'         inputId = "updateMax",
#'         label = "updateMax à la valeur en cours"
#'       ),
#'       actionButton_dsfr(
#'         inputId = "updateStep",
#'         label = "updateStep"
#'       ),
#'       verbatimTextOutput(outputId = "numericinputvalue")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     output$numericinputvalue <- renderText({
#'       paste("La valeur de l'input est", input$mynumericinput)
#'     })
#'
#'     r <- reactiveValues()
#'
#'     observeEvent(input$mynumericinput, {
#'       r$current_value <- input$mynumericinput
#'     })
#'
#'     observeEvent(input$updateLabel, {
#'       updateNumericInput_dsfr(
#'         session = session,
#'         inputId = "mynumericinput",
#'         label = sample(LETTERS, 10)
#'       )
#'     })
#'
#'     observeEvent(input$updateValue, {
#'       updateNumericInput_dsfr(
#'         session = session,
#'         inputId = "mynumericinput",
#'         value = round(
#'           runif(n = 1, min = 0, max = 1000)
#'         )
#'       )
#'     })
#'
#'     observeEvent(input$updateMin, {
#'       updateNumericInput_dsfr(
#'         session = session,
#'         inputId = "mynumericinput",
#'         min = r$current_value
#'       )
#'     })
#'
#'     observeEvent(input$updateMax, {
#'       updateNumericInput_dsfr(
#'         session = session,
#'         inputId = "mynumericinput",
#'         max = r$current_value
#'       )
#'     })
#'
#'     observeEvent(input$updateStep, {
#'       updateNumericInput_dsfr(
#'         session = session,
#'         inputId = "mynumericinput",
#'         step = round(runif(n = 1, min = 0.1, max = 1), digits = 1)
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
updateNumericInput_dsfr <- function(
  inputId,
  label = NULL,
  value = NULL,
  min = NULL,
  max = NULL,
  step = NULL,
  session = shiny::getDefaultReactiveDomain()
    ) {
  ns <- session$ns

  updateNumericInput(
    session = session,
    inputId = ns(inputId),
    label = label,
    value = value,
    min = min,
    max = max,
    step = step
  )
}