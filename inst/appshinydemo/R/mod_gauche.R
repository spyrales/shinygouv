#' gauche UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom glue glue
#' @importFrom ggplot2 ggplot aes geom_point labs
mod_gauche_ui <- function(id){
  ns <- NS(id)
  tagList(
    wellPanel(
      h3("Filtrer les donnees"),
      selectInput(inputId = ns("selectinput"),
                  label = "Species",
                  choices = list("setosa","versicolor","virginica")
                  ),

      radioButtons(inputId = ns("sepal_petal"),
                   label = "Sepal/Petal:",
                   choices = c("Sepal" = "Sepal.Length",
                               "Petal" = "Petal.Length")
                   ),

      sliderInput(inputId = ns("sliderinput"),
                  label = "Length:",
                  min = 4,
                  max = 8,
                  value = 8,
                  step = 0.2
                  ),
      checkboxInput(ns("see_graphe"), "Visualiser le graphe", FALSE),
      actionButton(inputId = ns("goButton"),
                   label = "Valider"
                   )
    )
  )
}

#' gauche Server Functions
#'
#' @noRd
mod_gauche_server <- function(id, global = global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$goButton, {

      global$data_filtre <- data_filtre(df = global$data,
                                        species = input$selectinput,
                                        sepal_petal = input$sepal_petal,
                                        max = input$sliderinput)

      global$resume <- glue("Vous avez selectionne l'espece {input$selectinput} dont le {input$sepal_petal} est inferieur a {input$sliderinput}")

      if (isTRUE(input$see_graphe)) {
        global$graphe <- ggplot(
          data = global$data_filtre,
          aes(
            x = Sepal.Length,
            y = Sepal.Width
          )
        ) +
          geom_point() +
          labs(caption = global$resume)
      } else {
        global$graphe <- NULL
      }
    })

  })
}

## To be copied in the UI
# mod_gauche_ui("gauche_1")

## To be copied in the server
# mod_gauche_server("gauche_1")
