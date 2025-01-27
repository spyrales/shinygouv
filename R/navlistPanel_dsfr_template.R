#' navlistPanel_dsfr_template
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
navlistPanel_dsfr_template <- function(
    navlistPanelId = NULL,
    li = NULL,
    divs = NULL,
    title = "",
    widths = c(4, 8)
) {
  # Le tabset complet
  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "navlistPanel.html",
      package = "shinygouv"
    ),
    navlistPanelId = navlistPanelId,
    li = li,
    divs = divs,
    title = title,
    widths = widths
  )
}

#' @noRd
listpanel_one_li <- function(
    id,
    content,
    first = 0
) {
  if(first == 1){
    firstdom <- list(' aria-current="page"',' fr-sidemenu__item--active')
  } else {
    firstdom <- list('','')
  }
  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "listsetsidemenu.html",
      package = "shinygouv"
    ),
    id = id,
    name = content,
    first = firstdom
  )
}
#' @noRd
listpanel_one_body <- function(
    id,
    content,
    panelid = 0
) {
  panelid <- as.integer(panelid)
  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "listbody.html",
      package = "shinygouv"
    ),
    id = id,
    content = content,
    panelid = panelid
  )
}
navlistPanel_dsfr_template(
  li = listpanel_one_li(
    "list-1",
    "List 1"
  ),
  divs = listpanel_one_body(
    "list-1",
    "List 1"
  )
)
