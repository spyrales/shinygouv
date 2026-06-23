#' header_dsfr
#' Vous pouvez ajouter le header officiel dans votre application avec `header_dsfr()`.
#' @param intitule la partie "intitule" du bloc marque. Utiliser un `shiny::tags$span()`pour mettre l'intitulé sur plusieurs lignes ou un vecteur.
#' @param url l url de redirection - optionnel
#' @param titre le texte de description de l url - optionnel
#' @param nom_site_service le nom du site ou du service - optionnel
#' @param baseline le texte sous le nom de site/service - optionnel
#' @param class un classe a ajouter si necessaire ("fr-m-1w" correspond a une margin de 1w sur tous les cotés) - optionnel, par defaut "fr-container" (centré) (voir le Systeme de design de l'Etat "fondamentaux-techniques/espacements")
#' @param choix_theme TRUE/FALSE (default) - affichage lien modal pour choix theme clair ou sombre dans le header
#' @param logo list(url,alttext,style) - affichage d'un logo dans le header à droite de la marianne. Les attributs doivent être tous remplis si on souhaite un logo - optionnel
#' @param fastlink list(list(lib, url, icon, blank)) - affichage de lien rapide dans le header. Les attributs doivent être tous remplis si on souhaite des liens rapide - optionnel (pour les icones voir https://www.systeme-de-design.gouv.fr/fondamentaux/icone/)
#'
#' @return html
#' @export
#'
#' @examples
#' if(interactive()) {
#'  shiny::shinyApp(
#'   ui = fluidPage_dsfr(
#'     header = header_dsfr(
#'       intitule = c("Pr\u00e9fet", "de", "Bretagne"),
#'       fastlink = list(list(lib="spyrales/shinygouv", url="https://github.com/spyrales/shinygouv/", icon="fr-icon-github-fill", blank=FALSE))
#'     )
#'   ),
#'     server = function(input, output) {}
#'  )
#' }
header_dsfr <- function(
    intitule = c("intitul\u00e9", "du", 'bloc-marque'),
    url = "/",
    titre = NULL,
    nom_site_service = NULL,
    baseline = NULL,
    class = "fr-container",
    choix_theme = FALSE,
    logo = NULL,
    fastlink = NULL
    ) {
  # check les params
  # assertthat::assert_that(is.character(intitule))
  # TODO verifier que l url est valide
  
  if(is.vector(intitule) & length(intitule) > 1){
    intitule <- span(HTML(paste0(intitule, collapse = "<br/>")))
  }
  if( choix_theme ){
    choix_theme_dom = choix_theme_template()
  } else {
    choix_theme_dom = ""
  }
  if( !is.null(logo) ){
    attempt::stop_if_not(
      (is.list(logo) & "url" %in% names(logo) & "alttext" %in% names(logo) & "style" %in% names(logo)),
      msg = "logo=list(url,alttext,style) must be correctly define for logo"
    )
    logodom = logooperator_template(logo)
  } else {
    logodom = ""
  }
  if( !is.null(fastlink) ){
    attempt::stop_if_not(
      (is.list(fastlink) & all(sapply(fastlink, function(x) { (is.list(x) & "url" %in% names(x) & "lib" %in% names(x) & "icon" %in% names(x) & "blank" %in% names(x)) }))),
      msg = "fastlink=list(list(url,lib,icon,blank)) must be correctly define for fastlink"
    )
    links = lapply(
      fastlink,
      function(x) {
        htmltools::htmlTemplate(
          filename = system.file(
            get_dsfr_version(with_v = TRUE),
            "composant",
            "fastlink.html",
            package = "shinygouv"
          ),
          icon = x$icon,
          lib = x$lib,
          url = x$url,
          blank = ifelse(x$blank,"_blank","_self")
        )
      }
    )
  } else {
    links = ""
  }

  res <- header_dsfr_template(
    class = class,
    intitule = intitule,
	logo = logodom,
    url = url,
    titre = titre,
    nom_site_service = nom_site_service,
    baseline = baseline,
    choix_theme = choix_theme_dom,
    links
  ) %>%
    parse_html()
	
  class(res) <- c("header_dsfr", class(res))
  res
}
