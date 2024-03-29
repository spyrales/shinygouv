# WARNING - Generated by {fusen} from dev/flat_composants/flat_radioButtons.Rmd: do not edit by hand

#' radioButtons_unique_dsfr_template
#'
#' @param inputId id de l'input avec indexation
#' @param choix choix une valeur a selectionner
#' @param nom_choix le nom de la valeur a selectionner/afficher
#' @param name nom de l'inputId sans indexation
#' @param checked Si TRUE, ajoute l'attribut checked
#' @param inline Si TRUE, positionne les choix en ligne (c'est-à-dire horizontalement).
#'
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
radioButtons_unique_dsfr_template <-
  function(inputId,
           choix,
           nom_choix,
           name,
           checked = FALSE,
           inline = FALSE

  ) {

    if (isTRUE(inline)) {
      class_inline <- "-inline"
      inline <- "fr-fieldset__element--inline"
    } else {
      class_inline <- NULL
      inline <- ""
    }
    htmltools::htmlTemplate(
      filename = system.file(
        get_dsfr_version(with_v = TRUE),
        "composant",
        "radiobouton.html",
        package = "shinygouv"
      ),
      inputId = inputId,
      name = name,
      nom_choix = nom_choix,
      value_choix = choix,
      inline = inline,
      checked = if (isTRUE(checked)) 'checked=""' else NULL,
      class_inline = class_inline
    )
  }
