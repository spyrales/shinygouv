#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  global <- reactiveValues(
    data = iris,
    data_filtre = iris,
    resume = NULL
  )

  mod_gauche_server("gauche_1", global = global)

  mod_droite_server("droite_1", global = global)
}
