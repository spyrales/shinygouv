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
    paste(input$go, "fois")
  })

  output$output2 <- renderText({
    paste("Esp\u00E8ce :", input$espece)
  })

  observeEvent(input$show_modal, {
    showModal_dsfr(
      ui = modalDialog_dsfr(
        tagList(
          htmltools::div("Le corps du texte"),
          actionButton_dsfr(
            inputId = "show_modal_btn",
            label = "Cliquez ici"
          )
        ),
        title = "Titre du modal",
        footer = "Footer du modal"
      )
    )
  })

  observeEvent(input$espece, {
    message("je change d'espece ", input$espece)
  })

  observeEvent(
    input$showspinner,
    {
      withSpinner_dsfr(
        expr = {
          message("Je vais m'afficher pendant 5 secondes")
          Sys.sleep(5)
        }
      )
    }
  )

  output$show_modal_n <- renderText({
    paste("Clics dans le modal :", input$show_modal_btn)
  })

  observeEvent(input$update, {
    updateSelectInput_dsfr(
      inputId = "selectinput",
      label = paste(sample(letters, 10), collapse = "")
    )
  })

  r <- reactiveValues(
    choices = LETTERS[1:10]
  )

  observeEvent(input$update2, {
    r$choices <- sample(c(LETTERS[1:10], letters[1:10]), 10)
    updateSelectInput_dsfr(
      inputId = "selectinput",
      choices = r$choices
    )
  })

  observeEvent(input$update3, {
    updateSelectInput_dsfr(
      inputId = "selectinput",
      selected = sample(r$choices, 1)
    )
  })
}
