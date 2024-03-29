# WARNING - Generated by {fusen} from /dev/tools/flat_tools.Rmd: do not edit by hand

#' Traduit du code html de htmltools pour du code xml
#'
#' @param html_code resultat de la fonction htmlTemplate
#' @importFrom XML htmlParse getNodeSet
#'
#' @noRd
parse_to_xml <- function(html_code, zone = "/html/body/*") {
  if (inherits(html_code, "XMLInternalElementNode")) {
    stop("Use this function with character or shiny.tag.list")
  }

  if (!is.character(html_code)) {
    html_code <- as.character(html_code)
  }
  html_code %>%
    XML::htmlParse(encoding = "UTF-8") %>%
    XML::getNodeSet(zone) %>%
    getElement(1)
}
