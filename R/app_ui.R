#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
    # Your application UI logic
    ui <- navbarPage_dsfr(
      title = "shinygouv",
      id = "nav",
	  dependencies = golem_add_external_resources(), # Leave this function for adding external resources
      header = header_dsfr(
        intitule = c("D\u00e9mo", "de", "{shinygouv}"),
        nom_site_service = "Application de d\u00e9monstration de {shinygouv}",
        baseline = "Bienvenue \u00e0 tous",
        choix_theme = TRUE,
        logo = list(url="modal-1.9.3/shinygouv.png",alttext="Logo Package shinygouv",style="width:4.5rem;"),
        fastlink = list(list(lib="spyrales/shinygouv", url="https://github.com/spyrales/shinygouv/", icon="fr-icon-github-fill", blank=FALSE))
      ),
      footer = footer_dsfr(
        intitule = c("D\u00e9mo", "de", "{shinygouv}"),
        description = "Une application de d\u00e9monstration de {shinygouv}",
        accessibilite = "non"
      ),
      navbarPanel_dsfr(
        title = "inputs d\'ui",
        mod_input_ui_ui("input_ui_1")
      ),
      navbarPanel_dsfr(
        title = "inputs d\'action",
        mod_input_actions_ui("input_actions_1")
      ),
      navbarPanel_dsfr(
        title = "inputs num\u00e9riques",
        mod_input_numeric_ui("input_numeric_1")
      ),
      navbarPanel_dsfr(
        title = "inputs \u00e0 choix limit\u00e9s",
        mod_input_limited_choices_ui("input_limited_choices_1")
      )
    )
	
	ui
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
    #favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shinygouv"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
