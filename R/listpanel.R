#' navlistPanel_dsfr
#'
#' Créez une mise en page (navlistPanel_dsfr()) composé d'un ensemble de panneau (tabPanel_dsfr())
#' et dont la vavigation s'effectue par un menu latéral à gauche. Ce menu latérale peut
#' contenir un titre de l'ensemble. Par défaut, les panneaux occupent les 2/3 de la largeur
#' et le menu le reste.
#'
#' @param id id du navlist/du tabPanel
#' @param ... liste de tabPanel_dsfr
#' @param title titre du navlist visible en haut du menu. optionnel
#' @param widths Largeurs de colonnes de la liste de navigation
#' et des zones de contenu de l'ensemble d'onglets respectivement.
#'
#' @return html
#' @references inspiré de la fonction [shiny::navlistPanel()]
#' @family layout functions
#'
#' @export
#' @rdname listPanel
#'
#' @examples
#' if (interactive()){
#'   library(shiny)
#'   shinyApp(
#'     ui = fluidPage_dsfr(
#'       navlistPanel_dsfr(
#'         "kikou",
#'         tabPanel_dsfr(
#'           id = "list1",
#'           title = "Un premier item list",
#'           content = tagList(
#'             h3("Coucou"),
#'             plotOutput("plot3")
#'           )
#'         ),
#'         tabPanel_dsfr(
#'           id = "list2",
#'           title = "Un deuxieme item list",
#'           content = tagList(
#'             h3("Salut"),
#'             plotOutput("plot4")
#'           )
#'         )
#'       )
#'     ),
#'     server = function(input, output) {
#'       output$plot3 <- renderPlot({
#'         plot(cars)
#'       })
#'       output$plot4 <- renderPlot({
#'         plot(iris)
#'       })
#'     }
#'   )
#' }
navlistPanel_dsfr <- function(
    id,
    ...,
    title = NULL,
    widths = c(4, 8)
) {
  if (missing(id)){
    stop("id is required")
  }
  titledom <- ifelse ( is.null(title), "", title)
  contenu <- list(...)
  navlistPanel_dsfr_template(
    navlistPanelId = id,
    li = purrr::imap(contenu, ~ {
      listpanel_one_li(
        .x$id,
        .x$title,
        .y
      )
    }),
    divs = purrr::imap(contenu, ~ {
      listpanel_one_body(
        id = .x$id,
        content = .x$content,
        panelid = .y
      )
    }),
    title = titledom,
    widths = widths
  )

}

