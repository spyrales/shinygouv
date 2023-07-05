#' input_numeric UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_input_numeric_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo numericInput_dsfr()"),
        # Adding space to the column
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        12,
        numericInput_dsfr(
          inputId = ns("mynumericinput"),
          label = "Numeric input",
          value = 12,
          min = 0,
          max = NA,
          step = 2
        ),
        verbatimTextOutput(
          outputId = ns("numericinputvalue")
        )
      )
    ),
    fluidRow_dsfr(
      column_dsfr(
        12,
        actionButton_dsfr(
          inputId = ns("updateLabel"),
          label = "Mettre \u00e0 jour le label"
        ),
        actionButton_dsfr(
          inputId = ns("updateValue"),
          label = "Mettre \u00e0 jour le param\u00e8tre value"
        ),
        actionButton_dsfr(
          inputId = ns("updateMin"),
          label = "Mettre \u00e0 jour le param\u00e8tre min \u00e0 la valeur en cours -10"
        ),
        actionButton_dsfr(
          inputId = ns("updateMax"),
          label = "Mettre \u00e0 jour le param\u00e8tre max \u00e0 la valeur en cours +10"
        ),
        actionButton_dsfr(
          inputId = ns("updateStep"),
          label = "Mettre \u00e0 jour le param\u00e8tre step"
        )
      )
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo sliderInput_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        6,
        sliderInput_dsfr(
          inputId = ns("sliderinput"),
          label = "Un slider",
          min = 0,
          max = 100,
          value = 50
        ),
        actionButton_dsfr(
          inputId = ns("updatesliderinput"),
          label = "Mettre \u00e0 jour le slider"
        )
      ),
      column_dsfr(
        6,
        textOutput(ns("sliderinputvalue"))
      )
    )


  )
}

#' input_numeric Server Functions
#'
#' @noRd
mod_input_numeric_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    r_local <- reactiveValues()

    ## numeric input
    output$numericinputvalue <- renderText({
      paste("La valeur de l\'input est", input$mynumericinput)
    })


    observeEvent(input$mynumericinput, {
      r_local$numeric_input_current_value <- input$mynumericinput
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
        min = r_local$numeric_input_current_value - 10
      )
    })

    observeEvent(input$updateMax, {
      updateNumericInput_dsfr(
        session = session,
        inputId = "mynumericinput",
        max = r_local$numeric_input_current_value + 10
      )
    })

    observeEvent(input$updateStep, {
      updateNumericInput_dsfr(
        session = session,
        inputId = "mynumericinput",
        step = sample(seq(0.1, 1, by = .1), size = 1)
      )
    })

    ## sliderInput
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


  })
}

## To be copied in the UI
# mod_input_numeric_ui("input_numeric_1")

## To be copied in the server
# mod_input_numeric_server("input_numeric_1")
