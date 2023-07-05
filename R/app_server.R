#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  # Your application server logic
  mod_input_actions_server("input_actions_1")

  mod_input_numeric_server("input_numeric_1")

  mod_input_ui_server("input_ui_1")

  mod_input_limited_choices_server("input_limited_choices_1")
}
