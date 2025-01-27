#' updateNavlistPanel_dsfr
#'
#' @param inputId inputId du navlistPanel_dsfr
#' @param selected titre ou id du tab à afficher (paramètre `title` ou `id` utilisé dans `tabPanel_dsfr()`)
#' @param session session shiny
#'
#' @importFrom shiny getDefaultReactiveDomain
#' @return html
#' @references inspiré de la fonction [shiny::updateNavlistPanel()]
#'
#' @export
#' @examples
#' if (interactive()){
#'   library(shiny)
#'   library(shinygouv)
#'   shinyApp(
#'     ui = fluidPage_dsfr(
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         h3("Demo navlistPanel_dsfr()"),
#'         # Adding space to the column
#'         # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
#'         extra_class = "fr-my-6w"
#'       ),
#'       column_dsfr(
#'         12,
#'         navlistPanel_dsfr(
#'           "testnavlistpanel",
#'           tabPanel_dsfr(
#'             id = "tab1",
#'             title = "Une prems tab",
#'             content = tagList(
#'               h3("Coucou le tab 1")
#'             )
#'           ),
#'           tabPanel_dsfr(
#'             id = "tab2",
#'             title = "Une deuxieme tab",
#'             content = tagList(
#'               h3("Salut le tab 2")
#'             )
#'           )
#'         )
#'       )
#'     ),
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         actionButton_dsfr(inputId = "showfirsttab",
#'                      "Afficher le premier onglet"
#'         ),
#'         actionButton_dsfr(inputId = "showsecondtab",
#'                      "Afficher le deuxi\u00e8me onglet"
#'         )
#'       )
#'     )
#'     ),
#'     server = function(input, output, session) {
#'           observeEvent(input$showfirsttab, {
#'       updateNavlistPanel_dsfr(
#'         inputId = "testnavlistpanel",
#'         selected = "Une prems tab",
#'         session = session
#'       )
#'     })
#'
#'     observeEvent(input$showsecondtab, {
#'       updateNavlistPanel_dsfr(
#'         inputId = "testnavlistpanel",
#'         selected = "Une deuxieme tab",
#'         session = session
#'       )
#'     })
#'     }
#'   )
#' }
updateNavlistPanel_dsfr <- function(
    inputId,
    selected = NULL,
    session = shiny::getDefaultReactiveDomain()
) {
  ns <- session$ns
  if(is.null(selected)) {
    stop("Vous devez sp\u00e9cifier au moins 1 onglet dans `selected`, soit l'`id` ou le `title` utilis\u00e9s pour d\u00e9finir les onglets.")
  }
  session$sendCustomMessage("updateNavlistPanelDsfr", message= list(navlistPanelId = inputId, titleToDisplay = selected))
}
