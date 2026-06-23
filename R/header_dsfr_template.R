#' header_dsfr_template
#' @param intitule la partie "intitule" du bloc marque. Utiliser un `shiny::tags$span()`pour mettre l'intitulé sur plusieurs lignes
#' @param url l url de redirection
#' @param titre le texte de description de l url
#' @param nom_site_service le nom du site ou du service - optionnel
#' @param baseline le texte sous le nom de site/service - optionnel
#' @param class un classe a ajouter si necessaire (".fr-m-1w" pour #TODO) - optionnel
#' @param choix_theme html modal theme sombre ou clair - optionnel
#' @param logo html pour intégration logo - optionnel
#' @param links html liens rapide - optionnel 
#' @importFrom htmltools htmlTemplate
#' @return html
#' @noRd
header_dsfr_template <- function(
    intitule, url, titre, nom_site_service, baseline, class, choix_theme = "", logo = "", links = ""
    ) {

  htmltools::htmlTemplate(
    filename = system.file(
      get_dsfr_version(with_v = TRUE),
      "composant",
      "entete.html",
      package = "shinygouv"
    ),
    class = class,
    logoopt = logo,
    intitule = intitule,
    url = url,
    titre = titre,
    nom_site_service = nom_site_service,
    baseline = baseline,
    choix_theme = choix_theme,
    links = links
  )
}
