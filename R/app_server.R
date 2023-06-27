#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  # Server logic for Tab 1
  output$output1 <- renderText({
    paste("You clicked", input$go, "times")
  })

  output$output2 <- renderText({
    paste("You've selected", input$espece)
  })
}
