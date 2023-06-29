#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage_dsfr(
      title = "shinygouv",
      id = "nav",
      header = header_dsfr(
        intitule = "D\u00e9mo",
        officiel = "shinygouv",
        nom_site_service = "D\u00e9mo de {shinygouv}",
        baseline = "https://github.com/spyrales/shinygouv"
      ),
      # First tab
      navbarPanel_dsfr(
        title = "actionButton_dsfr()",
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
              "go",
              label = "Un bouton avec un \u00e9!"
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "output1"
            ),
            extra_class = "fr-m-1w"
          )
        )
      ),
      # Second tab
      navbarPanel_dsfr(
        title = "radioButtons_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo radioButtons_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            4,
            radioButtons_dsfr(
              inputId = "espece",
              label = "Especes",
              choices = c("Setosa" = "setosa", "Versicolor" = "versicolor"),
              class = NULL
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "output2"
            ),
            extra_class = "fr-m-1w"
          )
        )
      ),
      # Third tab
      navbarPanel_dsfr(
        title = "modalDialog_dsfr()",
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
            actionButton_dsfr("show_modal", "Show modal dialog")
          ),
          column_dsfr(
            6,
            textOutput(
              "show_modal_n"
            )
          )
        )
      ),
      # Fourth tab
      navbarPanel_dsfr(
        title = "withSpinner_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo showspinner()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            12,
            actionButton_dsfr(
              inputId = "showspinner",
              label = "Afficher le spinner pendant 5 secondes"
            )
          )
        )
      ),

      # Fourth tab
      navbarPanel_dsfr(
        title = "selectInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo selectInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            3,
            selectInput_dsfr(
              inputId = "selectinput",
              label = "Variable:",
              choices = c(
                "Cylinders" = "cyl",
                "Transmission" = "am",
                "Gears" = "gear"
              )
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "update",
              label = "Mettre \u00e0 jour le label"
            )
          ),
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "update2",
              label = "Mettre \u00e0 jour les choix"
            )
          ),
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "update3",
              label = "Mettre \u00e0 jour l\'option s\u00e9lectionn\u00e9e"
            )
          )
        )
      ),
      # Sixth tab
      navbarPanel_dsfr(
        title = "checkboxInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo checkboxInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            3,
            checkboxInput_dsfr(
              inputId = "mycheckboxInput",
              label = "Une case \u00e0 cocher",
              value = FALSE
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updatelab_checkboxinput",
              label = "Mettre \u00e0 jour le label"
            )
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updateval_checkboxinput",
              label = "Mettre \u00e0 jour la value "
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shinygouv"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
