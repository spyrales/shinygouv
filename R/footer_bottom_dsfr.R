# WARNING - Generated by {fusen} from /dev/flat_composants/flat_footer.Rmd: do not edit by hand

#' footer_bottom_dsfr
#' 
#' Il se compose des éléments suivants:
#'- la liste de liens liés aux obligations légales. Cette liste doit être définie en fonction du site, toutefois les liens & contenus suivants sont obligatoires : “accessibilité : non/partiellement/totalement conforme”, mentions légales, données personnelles et gestion des cookies. - obligatoire.
#' - une mention de la licence - obligatoire “Sauf mention contraire, tous les contenus de ce site sont sous licence etalab-2.0”
#' 
#' @param accessibilite le type d'accessibilité (non/partiellement/totalement conforme)
#' @param lien_accessibilite lien url vers l'accessibilite
#' @param lien_mentions_legales lien url vers les mentions légales
#' @param lien_donnees_personnelles lien url vers les données personnelles
#' @param lien_gestion_cookies lien url vers la gestion des cookies
#' @param ... d'autre liens de références (voir `footer_li_dsfr()`)
#'
#' @return html
#' @rdname footer_dsfr
#' @export
footer_bottom_dsfr <-
  function(accessibilite = "non",
           ...,
           lien_accessibilite = "#",
           lien_mentions_legales = "#",
           lien_donnees_personnelles = "#",
           lien_gestion_cookies = "#") {
    

      assertthat::assert_that(is.character(accessibilite))
      assertthat::assert_that(is.character(lien_accessibilite))
      assertthat::assert_that(is.character(lien_mentions_legales))
      assertthat::assert_that(is.character(lien_donnees_personnelles))
      assertthat::assert_that(is.character(lien_gestion_cookies))
    
    if ( isFALSE(accessibilite %in% c("non", "partiellement", "totalement conforme"))){
      stop("l accessibilite doit etre 'non', 'partiellement' ou 'totalement conforme'")
    }
    
    contenu <- list(...)
    htmltools::htmlTemplate(
      filename = system.file(
        get_dsfr_version(with_v = TRUE),
        "composant",
        "piedpage_bottom.html",
        package = "shinygouv"
      ),
      accessibilite = accessibilite,
      lien_accessibilite = lien_accessibilite,
      lien_mentions_legales = lien_mentions_legales,
      lien_donnees_personnelles = lien_donnees_personnelles,
      lien_gestion_cookies = lien_gestion_cookies,
      bottom_list = purrr::map(contenu, ~ {
        footer_one_li(
          id = .x$id,
          href = .x$href,
          titre = .x$titre,
          texte = .x$texte,
          type = "bottom"
        )
      })
    )
  }

