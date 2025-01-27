#' accordion_dsfr
#'
#' Créez une mise en page (accordion_dsfr()) composé d'un ensemble de
#' panneau (accordion_panel_dsfr()) articuler à travers un système d'accordéon.
#'
#' @param ... liste de accordion_panel_dsfr
#' @param id id du accordion. obligatoire si usage update.
#' @param class extraclass appliquée à la `<div class="fr-accordions-group">`
#' @param open ouverture ou fermeture du premier accordion_panel. True par défaut
#'
#' @importFrom purrr imap
#' @return html
#' @references inspiré de la fonction [bslib::accordion()]
#'
#' @export
#' @rdname accordion_dsfr
#'
#' @examples
#' #Demo accordion_dsfr()
#' if (interactive()){
#'   library(shiny)
#'   shinyApp(
#'     ui = fluidPage_dsfr(
#'       accordion_dsfr(
#'         accordion_panel_dsfr(
#'           title = "Un premier accordeon",
#'           content = tagList(
#'             h3("Coucou"),
#'             plotOutput("plot5")
#'           )
#'         ),
#'         accordion_panel_dsfr(
#'           title = "Un deuxieme accordeon",
#'           content = tagList(
#'             h3("Salut"),
#'             plotOutput("plot6")
#'           )
#'         )
#'       )
#'     ),
#'     server = function(input, output) {
#'       output$plot5 <- renderPlot({
#'         plot(cars)
#'       })
#'       output$plot6 <- renderPlot({
#'         plot(iris)
#'       })
#'     }
#'   )
#' }
accordion_dsfr <- function(
    ...,
    id = NULL,
    class = NULL,
    open = TRUE
) {
  accordionId <- ifelse ( is.null(id), "", paste0(' id="',id,'"'))
  class <- ifelse ( is.null(class), "", class)
  openid <- ifelse ( open == TRUE, 1, 0)
  contenu <- list(...)
  accordion_dsfr_template(
    accordionId = accordionId,
    extraclass = class,
    divs = purrr::imap(contenu, ~ {
      idnet <- ifelse ( is.null(id), .x$id, "dsfr-accordion-panel")
      accordion_panel_one(
        id = paste0(idnet,'-',as.character(id),'-',.y),
        title = .x$title,
        content = .x$content,
        icon = .x$icon,
        num = .y,
        open = openid
      )
    })
  )

}

#' @param title Un titre à apparaître dans l'en-tête de `accordion_panel_dsfr()`.
#' @param ... contenu html
#' @param icon la class dsfr de l'icone (https://www.systeme-de-design.gouv.fr/fondamentaux/icone) positionnée avant `title`.
#' @export
#' @rdname accordion_dsfr
accordion_panel_dsfr <- function(
    title,
    content,
    icon = NULL
){
  if (missing(title) | missing(content)){
    stop("title and content are required in accordion_panel")
  }
  icondom <- ifelse ( is.null(icon), "", paste0('<span class="',icon,'" aria-hidden="true"></span>'))
  id <- paste0("dsfr-accordion-panel-", sample.int(10000, 1))
  list(
    id = id,
    title = title,
    content = content,
    icon = icondom
  )
}

#' accordion_panel_open_dsfr
#'
#' @param inputId id du accordion_dsfr
#' @param selected titre du accordion_panel_dsfr à ouvrir ou fermer (paramètre `title` utilisé dans `accordion_panel_dsfr()`)
#' @param session session shiny
#' @export
#' @rdname accordion_dsfr
#' @examples
#' #Demo accordion_panel_open_dsfr()
#' if (interactive()){
#'   library(shiny)
#'   library(shinygouv)
#'   shinyApp(
#'     ui = fluidPage_dsfr(
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         h3("Demo accordion_panel_open_dsfr()"),
#'         extra_class = "fr-my-6w"
#'       ),
#'       column_dsfr(
#'         12,
#'         accordion_dsfr(
#'           id = "testaccordion",
#'           accordion_panel_dsfr(
#'             title = "Un prems accord",
#'             content = tagList(
#'               h3("Coucou accordeon 1")
#'             )
#'           ),
#'           accordion_panel_dsfr(
#'             title = "Un deuz accord",
#'             content = tagList(
#'               h3("Salut accordeon 2")
#'             )
#'           )
#'         )
#'       )
#'     ),
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         actionButton_dsfr(inputId = "showsecondaccord",
#'                      "Ouvrir le deuxi\u00e8me onglet"
#'         )
#'       )
#'     )
#'     ),
#'     server = function(input, output, session) {
#'    observeEvent(input$showsecondaccord, {
#'       accordion_panel_open_dsfr(
#'         inputId = "testaccordion",
#'         selected = "Un deuz accord",
#'         session = session
#'       )
#'     })
#'
#'     }
#'   )
#' }
accordion_panel_open_dsfr <- function(
    inputId,
    selected = NULL,
    session = shiny::getDefaultReactiveDomain()
) {
  ns <- session$ns
  if(is.null(selected)) {
    stop("Vous devez sp\u00e9cifier 1 accordion_panel dans `selected` avec le `title` utilis\u00e9s pour le d\u00e9finir.")
  }
  session$sendCustomMessage("updateAccordionDsfr", message= list(accordionId = inputId, titleToDisplay = selected, open = "t"))
}

#' accordion_panel_close_dsfr
#'
#' @param inputId id du accordion_dsfr
#' @param session session shiny
#' @export
#' @rdname accordion_dsfr
#' @examples
#' #Demo accordion_panel_close_dsfr()
#' if (interactive()){
#'   library(shiny)
#'   library(shinygouv)
#'   shinyApp(
#'     ui = fluidPage_dsfr(
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         h3("Demo accordion_panel_close_dsfr()"),
#'         extra_class = "fr-my-6w"
#'       ),
#'       column_dsfr(
#'         12,
#'         accordion_dsfr(
#'           id = "testaccordion",
#'           accordion_panel_dsfr(
#'             title = "Un prems accord",
#'             content = tagList(
#'               h3("Coucou accordeon 1")
#'             )
#'           ),
#'           accordion_panel_dsfr(
#'             title = "Un deuz accord",
#'             content = tagList(
#'               h3("Salut accordeon 2")
#'             )
#'           )
#'         )
#'       )
#'     ),
#'     fluidRow_dsfr(
#'       column_dsfr(
#'         12,
#'         actionButton_dsfr(inputId = "hidefirstaccord",
#'                      "Fermer les onglets"
#'         )
#'       )
#'     )
#'     ),
#'     server = function(input, output, session) {
#'
#'     observeEvent(input$hidefirstaccord, {
#'       accordion_panel_close_dsfr(
#'         inputId = "testaccordion",
#'         session = session
#'       )
#'     })
#'     }
#'   )
#' }
accordion_panel_close_dsfr <- function(
    inputId,
    session = shiny::getDefaultReactiveDomain()
) {
  selected = NULL
  ns <- session$ns
  session$sendCustomMessage("updateAccordionDsfr", message= list(accordionId = inputId, titleToDisplay = selected, open = "f"))
}

