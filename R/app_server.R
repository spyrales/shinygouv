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
    paste("Esp\u00e8ce :", input$espece)
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
    message("je change d\'espece ", input$espece)
  })

  observeEvent(
    input$showspinner,
    {
      withSpinner_dsfr(
        expr = {
          message("Je vais m\'afficher pendant 5 secondes")
          Sys.sleep(5)
        }
      )
    }
  )

  output$show_modal_n <- renderText({
    paste("Clics dans le modal :", input$show_modal_btn)
  })

  observeEvent(input$updateselectinput, {
    updateSelectInput_dsfr(
      inputId = "selectinput",
      label = paste(sample(letters, 10), collapse = "")
    )
  })

  r <- reactiveValues(
    choices = LETTERS[1:10]
  )

  observeEvent(input$updateselectinput2, {
    r$choices <- sample(c(LETTERS[1:10], letters[1:10]), 10)
    updateSelectInput_dsfr(
      inputId = "selectinput",
      choices = r$choices
    )
  })

  observeEvent(input$updateselectinput3, {
    updateSelectInput_dsfr(
      inputId = "selectinput",
      selected = sample(r$choices, 1)
    )
  })


  observeEvent(input$toggleswitch, {
    message(input$toggleswitch)
    message("Vous avez activ\u00e9 le toggle switch")
  })

  output$toggleswitchvalue <- renderText({
    paste0("La valeur du toggleSwitch est ", input$toggleswitch)
  })

  observeEvent(input$updatetoggleswitch, {
    updateToggleSwitch_dsfr(
      session = session,
      inputId = "toggleswitch",
      value = sample(c(TRUE,FALSE), 1),
      label = sample(r$choices, 1),
      activate = sample(r$choices, 1),
      deactivate = sample(r$choices, 1)
    )
  })

}
