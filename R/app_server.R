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
          htmltools::div("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
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
      value = sample(c(TRUE, FALSE), 1),
      label = sample(r$choices, 1),
      activate = sample(r$choices, 1),
      deactivate = sample(r$choices, 1)
    )
  })


  ## checkboxinput

  observeEvent(input$updatelab_checkboxinput, {
    updateCheckboxInput_dsfr(
      session = session,
      inputId = "mycheckboxInput",
      label = sample(r$choices, 1)
    )
  })

  observeEvent(input$updateval_checkboxinput, {
    updateCheckboxInput_dsfr(
      session = session,
      inputId = "mycheckboxInput",
      value = !input$mycheckboxInput,
    )
  })

  output$plot <- renderPlot({
    plot(utils::head(datasets::iris, input$tabpaneln))
  })
  output$plot2 <- renderPlot({
    plot(utils::head(datasets::cars, input$tabpaneln2))
  })

  ## numeric input
  output$numericinputvalue <- renderText({
    paste("La valeur de l'input est", input$mynumericinput)
  })


  observeEvent(input$mynumericinput, {
    r$numeric_input_current_value <- input$mynumericinput
  })

  observeEvent(input$updateLabel, {
    updateNumericInput_dsfr(
      session = session,
      inputId = "mynumericinput",
      label = sample(LETTERS, 10)
    )
  })

  observeEvent(input$updateValue, {
    updateNumericInput_dsfr(
      session = session,
      inputId = "mynumericinput",
      value = sample(1:1000, size = 1)
    )
  })

  observeEvent(input$updateMin, {
    updateNumericInput_dsfr(
      session = session,
      inputId = "mynumericinput",
      min = r$numeric_input_current_value - 10
    )
  })

  observeEvent(input$updateMax, {
    updateNumericInput_dsfr(
      session = session,
      inputId = "mynumericinput",
      max = r$numeric_input_current_value + 10
    )
  })

  observeEvent(input$updateStep, {
    updateNumericInput_dsfr(
      session = session,
      inputId = "mynumericinput",
      step = sample(seq(0.1, 1, by = .1), size = 1)
    )
  })
  output$sliderinputvalue <- renderText({
    paste0("La valeur du slider est ", input$sliderinput)
  })

  observeEvent(
    input$updatesliderinput,
    {
      updateSliderInput_dsfr(
        session = session,
        inputId = "sliderinput",
        value = sample(1:100, 1)
      )
    }
  )

  output$outputespece_radiogroupbutton <- renderText({
    paste("Esp\u00e8ce radiogroupbutton :", input$espece_radiogroupbutton)
  })

  output$outputespece_radiogroupbutton2 <- renderText({
    paste("Esp\u00e8ce radiogroupbutton :", input$espece_radiogroupbutton2)
  })


  observeEvent(input$update_radiogroupbutton_label, {

    updateRadioGroupButtons_dsfr(
      inputId = "espece_radiogroupbutton",
      label = paste0(sample(LETTERS, size = 12), collapse = ""),
      session = session
    )
  })

  observeEvent(input$update_radiogroupbutton_choices, {

    r$radiogroupubutton_choices <- sapply(1:5, function(x) paste0(sample(LETTERS, size = 3), collapse = ""))

               updateRadioGroupButtons_dsfr(
                 inputId = "espece_radiogroupbutton",
                 choices = r$radiogroupubutton_choices,
                 session = session
               )
  })

  observeEvent(input$update_radiogroupbutton_selected, {

    updateRadioGroupButtons_dsfr(
      inputId = "espece_radiogroupbutton",
      selected = sample(r$radiogroupubutton_choices, size = 1),
      session = session
    )
  })
}
