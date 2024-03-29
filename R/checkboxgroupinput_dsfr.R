# WARNING - Generated by {fusen} from dev/flat_composants/flat_checkBoxInput.Rmd: do not edit by hand

#' checkboxGroupInput_dsfr
#'
#' @param inputId id de l'input
#' @param label label du bouton
#' @param choices Liste des valeurs à sélectionner (si les éléments de la liste portent un nom, c'est ce nom qui est affiché à l'utilisateur et non la valeur)
#' @param selected Valeurs préselectionnées
#' @param inline Si TRUE, positionne les choix en ligne (c'est-à-dire horizontalement).
#' @return html
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'   
#'   library(shiny)
#'   
#'   ui <- fluidPage_dsfr(
#'     checkboxGroupInput_dsfr("checkboxes", "Variables to show:",
#'                             c("Cylinders" = "cyl",
#'                               "Transmission" = "am",
#'                               "Gears" = "gear"), inline = TRUE)
#'   )
#'   
#'   server <- function(input, output, session) {
#'     observeEvent(input$checkboxes, {
#'       print(input$checkboxes)
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
checkboxGroupInput_dsfr <- function(inputId,
                                    label, choices = NULL, selected = NULL, inline = FALSE) {
  
  # check les params
  assertthat::assert_that(is.character(inputId))
  assertthat::assert_that(is.character(label))
  assertthat::assert_that(is.logical(inline))
  
  # if choices is null then choices_value and choice_names must be not empty with the same length
  # assertthat::assert_that(!is.null(choices) | (length(choice_values) > 0 & length(choice_values) == length(choice_names)))
  #
  checkboxGroupInput_dsfr_template(inputId,
                                   label = label,
                                   choix = choices,
                                   checked = selected,
                                   inline = inline) %>%
    parse_html()
}
