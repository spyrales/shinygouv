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
    fluidPage_dsfr(
      header = header_dsfr(
        intitule = "Intitul\u00E9",
        officiel = "Officiel",
        nom_site_service = "Nom du site / service",
        baseline = "Baseline - Pr\u00E9cisions sur l'organisation",
        class = "fr-m-1w"
      ),
      title = "Exemple shiny dsfr",
      h1("Exemple d'utilisation de {shinygouv}"),
      fluidRow_dsfr(
        column_dsfr(
          0, # Calcul automatique de la largeur
          p("Premi\u00E8re Colonne"),
          actionButton_dsfr("go", label = "Bouton avec un accent \u00E9"),
          actionButton_dsfr(
            "updateradiobutton",
            label = "Changer le radio button d'esp\u00E8ces"
          ),
          plotOutput(
            "plot_sample"
          )
        ),
        column_dsfr(
          0, # Calcul automatique de la largeur
          p("Deuxi\u00E8me Colonne"),
          radioButtons_dsfr(
            inputId = "espece",
            label = "Esp\u00E8ces",
            choices = c("Setosa" = "setosa", "Versicolor" = "versicolor"),
            class = NULL
          ),
          plotOutput(
            "plot_espece"
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
