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
        intitule = "Intitule",
        officiel = "Officiel",
        nom_site_service = "Nom du site / service",
        baseline = "baseline - precisions sur l organisation",
        class = "fr-m-1w"
      ),
      title = "Exemple shiny dsfr",
      h1("Exemple d'utilisation de {shinygouv}"),
      fluidRow_dsfr(
        column_dsfr(
          0, # Calcul automatique de la largeur
          p("Premi\\u00E8re Colonne"),
          actionButton_dsfr("go", label = "Sample!"),
          actionButton_dsfr("updateradiobutton", label = "Update RadioButtons!"),
          actionButton_dsfr("updatecheckbox", label = "Update Checkbox!"),
          plotOutput(
            "plot_sample"
          )
        ),
        column_dsfr(
          0, # Calcul automatique de la largeur
          p("Deuxi\\u00E8me Colonne"),
          radioButtons_dsfr(
            inputId = "espece",
            label = "Especes",
            choices = c("Setosa" = "setosa", "Versicolor" = "versicolor"),
            class = NULL
          ),
          checkboxInput_dsfr(inputId = "case_a_cocher",
                             label = "Groupe de case a cocher",
                             choices = c("A" = "a", "B" = "b")),
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
