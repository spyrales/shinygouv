#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  observeEvent(input$go,{
    message("je clique ", input$go)
  })

  observeEvent(input$espece,{
    message("je change d'esepce ", input$espece)
  })

}
