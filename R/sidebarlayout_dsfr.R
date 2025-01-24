#' sidebarLayout_dsfr
#'
#' Créez une mise en page (`sidebarLayout_dsfr()`) avec une barre latérale (`sidebarPanel_dsfr()`) et
#' une zone principale (`mainPanel_dsfr()`). La barre latérale peut s'afficher avec une
#' couleur d'arrière-plan grise et contient généralement des contrôles d'entrée.
#' La zone principale occupe les 2/3 de la largeur et contient généralement des sorties.
#'
#' @param sidebarPanel Le `sidebarPanel_dsfr()` contenant les contrôles d'entrée.
#' @param mainPanel Le `mainPanel_dsfr()` contenant les sorties.
#' @param position La position de la barre latérale par rapport à la zone principale ("gauche"
#' ou "droit").
#' @param width La largeur de la barre latérale et du panneau principal. Par défaut,
#' La barre latérale occupe 1/3 de la largeur et le panneau principal 2/3. Le total
#' doit être inférieur ou égale à 12.
#' @param title titre du panneau de barre latérale (facultatif)
#' @param ... Éléments de sortie à inclure dans la barre latérale/panneau principal.
#' @return html
#' @references inspiré de la fonction [shiny::sidebarLayout()]
#' @family layout functions
#' @rdname sidebarLayout_dsfr
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#' options(device.ask.default = FALSE)
#'
#' # Define UI
#' ui <- fluidPage_dsfr(
#'
#'   # Application title
#'   titlePanel("Hello Shiny!"),
#'
#'   sidebarLayout_dsfr(
#'
#'     # Sidebar with a slider input
#'     sidebarPanel_dsfr(
#'       sliderInput_dsfr("obs",
#'                   "Number of observations:",
#'                   min = 0,
#'                   max = 1000,
#'                   value = 500),
#'       width = 4,
#'       title = "My sidebar"
#'     ),
#'
#'     # Show a plot of the generated distribution
#'     mainPanel_dsfr(
#'       plotOutput("distPlot")
#'     )
#'   )
#' )
#'
#' # Server logic
#' server <- function(input, output) {
#'   output$distPlot <- renderPlot({
#'     hist(rnorm(input$obs))
#'   })
#' }
#'
#' # Complete app with UI and server components
#' shinyApp(ui, server)
#' }
#' @export
sidebarLayout_dsfr <- function(
    sidebarPanel,
    mainPanel,
    position = c("left", "right")
) {
  # determine the order
  position <- match.arg(position)
  if (position == "left") {
    firstPanel <- sidebarPanel
    secondPanel <- mainPanel
  }
  else if (position == "right") {
    firstPanel <- mainPanel
    secondPanel <- sidebarPanel
  }
  fluidRow_dsfr(firstPanel, secondPanel, class = "fr-col-12")
}

#' sidebarPanel_dsfr
#' @export
#' @rdname sidebarLayout_dsfr
sidebarPanel_dsfr <- function(..., width = 4, title = NULL) {
  column_dsfr(
    width = width,
    wellPanel_dsfr(..., title = title),
    extra_class = "sb-complementary"
  )
}

#' mainPanel_dsfr
#' @export
#' @rdname sidebarLayout_dsfr
mainPanel_dsfr <- function(..., width = 8) {
  column_dsfr(
    width = width,
    ...,
    extra_class = "fr-py-2w fr-px-4w sb-main"
  )
}
