#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  observeEvent(input$go, {
    message("je clique ", input$go)
  })

  observeEvent(input$updateradiobutton, {
    updateRadioButtons_dsfr(
      session = session,
      inputId = "espece",
      label = "Un nouveau label",
      choices = c("Espece A" = "a", "Espece B" = "b")
    )
  })

  observeEvent(input$updatecheckbox, {
    updateCheckboxInput_dsfr(
      session = session,
      inputId = "case_a_cocher",
      label = "Un nouveau case à cocher",
      choice_values = c("case a", "case b"),
      choice_names = c("Case A", "Case b")
    )
  })

  observeEvent(input$espece, {
    message("je change d'espece ", input$espece)
  })

  observeEvent(input$case_a_cocher, {
    message("case_a_cocher ", input$case_a_cocher)
  })
}
