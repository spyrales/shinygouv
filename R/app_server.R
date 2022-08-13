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
      label = "Un nouveau label avec la selection de l'espece A",
      choices = c("Espece A" = "a", "Espece B" = "b"),
      selected = "a"
    )
  })

  observeEvent(input$espece, {
    message("je change d'espece ", input$espece)
  })
}
