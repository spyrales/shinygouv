#' droite UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom DT dataTableOutput renderDataTable
mod_droite_ui <- function(id){
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("resume")),
    dataTableOutput(ns("table")),
    plotOutput(ns("graphe"))
  )
}

#' droite Server Functions
#'
#' @noRd
mod_droite_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns


    output$table <- renderDataTable(
      global$data_filtre
    )

    output$resume <- renderText(
      global$resume
    )

    output$graphe <- renderPlot(
      global$graphe
    )

  })
}

## To be copied in the UI
# mod_droite_ui("droite_1")

## To be copied in the server
# mod_droite_server("droite_1")
