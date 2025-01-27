#' accordion_dsfr_template
#'
#' @param accordionId id de l'accordeon
#' @param extraclass des classes a ajouter si necessaire
#' @param divs contenu html de l'accordeon
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
accordion_dsfr_template <- function(
    accordionId = NULL,
    extraclass = NULL,
    divs = NULL
) {
  class <- ifelse ( is.null(extraclass), "", extraclass)
  # Le tabset complet
  htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "accordion.html",
      package = "shinygouv"
    ),
    accordionId = accordionId,
    divs = divs,
    extraclass = class
  )
}
#' accordion_panel_one
#'
#' @param id id du accordion_panel
#' @param title titre du accordion_panel
#' @param content contenu html du accordion_panel
#' @param icon class icon
#' @param num numéro du panneau
#' @param open numéro du panneau à ouvrir par défaut (1 si open 0 sinon)
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
accordion_panel_one <- function(
    id,
    title,
    content,
    icon = NULL,
    num = 1,
    open = 1
) {
  expand <- ifelse ( as.integer(num) == as.integer(open), "true", "false" )
  icondom <- ifelse ( is.null(icon), "", icon )
  htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "accordbody.html",
      package = "shinygouv"
    ),
    id = id,
    title = title,
    content = content,
    icon = icondom,
    expand = expand
  )
}
accordion_dsfr_template(
  divs = accordion_panel_one(
    id = "accord-1",
    title = "Accordeon 1",
    content = "Accordeon 1 contenu"
  )
)
