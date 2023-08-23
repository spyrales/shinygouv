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
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo fileInput_dsfr()"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-2w"
      ),
      column_dsfr(width = 4,
                  fileInput_dsfr(inputId = ns("user_file"), label = "Importez vos donn\u00e9es", message = "Seul le format csv est pris en charge."),
                  br(),
                  checkboxInput_dsfr(inputId = ns("header_csv"), label = "Utiliser les en-tetes du fichier", value = TRUE),
                  extra_class = "fr-px-1w"),
      column_dsfr(width = 8,
                  tableOutput_dsfr(outputId = ns("contenu")),
                  extra_class = "fr-px-1w"
      )
    ),

    tags$br(),
    tags$hr()


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

  output$contenu <- renderTable({
    req(input$user_file)
    user_file <- input$user_file
    ext <- tools::file_ext(user_file$datapath)
    validate(need(ext == "csv", "Veuillez choisir un fichier csv svp"))
    read.csv2(user_file$datapath, header = input$header_csv, nrows = 5)
  })

  })

}

## To be copied in the UI
# mod_input_actions_ui("input_actions_1")

## To be copied in the server
# mod_input_actions_server("input_actions_1")
