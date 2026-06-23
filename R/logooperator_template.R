#' logooperator_template
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
logooperator_template <- function(imgl) {

  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "logo_operator.html",
      package = "shinygouv"
    ),
    urlimg=imgl$url,
    textimg = imgl$alttext,
    styleimg = imgl$style
  )
}
