#' input_actions UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_input_actions_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo actionButton_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        4,
        actionButton_dsfr(
          inputId = ns("go"),
          label = "Un bouton avec un \u00e9!"
        ),
        extra_class = "fr-m-1w"
      ),
      column_dsfr(
        6,
        textOutput(
          ns("nb_clic_sur_le_bouton")
        ),
        extra_class = "fr-m-1w"
      )
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo modalDialog_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        6,
        actionButton_dsfr(inputId = ns("show_modal"),
                          label = "Show modal dialog"
                          )
      ),
      column_dsfr(
        6,
        textOutput(
          ns("show_modal_n")
        )
      )
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo withSpinner_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      ),
      column_dsfr(
        12,
        actionButton_dsfr(
          inputId = ns("showspinner"),
          label = "Afficher le spinner pendant 5 secondes"
        )
      )
    )

  )
}

#' input_actions Server Functions
#'
#' @noRd
mod_input_actions_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    ## Action Button
    output$nb_clic_sur_le_bouton <- renderText({
      paste("Vous avez cliqu\u00e9", input$go, "fois")
    })



    ## Modal
    observeEvent(input$show_modal, {
      showModal_dsfr(
        ui = modalDialog_dsfr(
          tagList(
            htmltools::div("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            actionButton_dsfr(
              inputId = ns("show_modal_btn"),
              label = "Cliquez ici"
            )
          ),
          title = "Titre du modal",
          footer = "Footer du modal"
        )
      )
    })

    output$show_modal_n <- renderText({
      paste("Clics dans le modal :", input$show_modal_btn)
    })

    ## Spinner
    observeEvent(
      input$showspinner,
      {
        withSpinner_dsfr(
          expr = {
            Sys.sleep(5)
          }
        )
      }
    )

  })
}

## To be copied in the UI
# mod_input_actions_ui("input_actions_1")

## To be copied in the server
# mod_input_actions_server("input_actions_1")
