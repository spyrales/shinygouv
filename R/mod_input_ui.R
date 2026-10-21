#' input_ui UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_input_ui_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo tabsetPanel_dsfr() et tabPanel_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        12,
        tabsetPanel_dsfr(
          "testtabpanel",
          tabPanel_dsfr(
            id = ns("tab1"),
            title = "Une prems tab",
            content = tagList(
              h3("Coucou"),
              numericInput_dsfr(
                inputId = ns("tabpaneln"),
                label = "Nombre de points sur le graph",
                value = 100
              ),
              plotOutput(ns("plot"))
            )
          ),
          tabPanel_dsfr(
            id = ns("tab2"),
            title = "Une deuxieme tab",
            content = tagList(
              h3("Salut"),
              numericInput_dsfr(
                inputId = ns("tabpaneln2"),
                label = "Nombre de points sur le plot",
                value = 10
              ),
              plotOutput(ns("plot2"))
            )
          )
        )
      )
    ),
    fluidRow_dsfr(
      column_dsfr(
        12,
        actionButton_dsfr(inputId = ns("showfirsttab"),
                     "Afficher le premier onglet"
        ),
        actionButton_dsfr(inputId = ns("showsecondtab"),
                     "Afficher le deuxi\u00e8me onglet"
        )
      )
    ),
    fluidRow_dsfr( class = "fr-my-4w",
       column_dsfr(
         12,
         h3("Demo wellPanel_dsfr() et sidebarLayout_dsfr()"),
         extra_class = "fr-my-6w"
       ),
       column_dsfr(
         12,
         wellPanel_dsfr("Ceci est un wellPanel avec titre", title="Mon wellPanel"),
         wellPanel_dsfr("Ceci est un wellPanel avec option grey et sans titre", grey = TRUE)
       ),
       sidebarLayout_dsfr(
         # Sidebar with a slider input
         sidebarPanel_dsfr(
           sliderInput_dsfr(
             ns("obssb"),
             "Nombre d'observations:",
             min = 0,
             max = 1000,
             value = 500),
           width = 4,
           title = "Mon sidebarPanel"
         ),
         # Show a plot of the generated distribution
         mainPanel_dsfr(
           plotOutput(ns("distPlot"))
         )
       )
    )
  )
}

#' input_ui Server Functions
#'
#' @noRd
mod_input_ui_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({
      plot(utils::head(datasets::iris, input$tabpaneln))
    })

    output$plot2 <- renderPlot({
      plot(utils::head(datasets::cars, input$tabpaneln2))
    })

    observeEvent(input$showfirsttab, {
      updateTabsetPanel_dsfr(
        inputId = "testtabpanel",
        selected = "Une prems tab",
        session = session
      )
    })

    observeEvent(input$showsecondtab, {
      updateTabsetPanel_dsfr(
        inputId = "testtabpanel",
        selected = "Une deuxieme tab",
        session = session
      )
    })

    #well
    output$distPlot <- renderPlot({
      hist(rnorm(input$obssb))
    })

  })

}

## To be copied in the UI
# mod_input_ui_ui("input_ui_1")

## To be copied in the server
# mod_input_ui_server("input_ui_1")
