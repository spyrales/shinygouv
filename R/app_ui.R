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
        intitule = "D\u00E9mo",
        officiel = "shinygouv",
        nom_site_service = "D\u00E9mo de {shinygouv}",
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
              label = "Un bouton avec un \u00E9!"
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
      fluidRow_dsfr(
        column_dsfr(
          0, # Calcul automatique de la largeur
          p("Afficher le spinner"),
          actionButton_dsfr(
            inputId = "showspinner",
            label = "Afficher le spinner pendant 5 secondes"
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
