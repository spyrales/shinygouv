#' ddsfr dependances
#'
#' Ajout le css et le js de dsfr
#'
#' @param tag element de la page pour attacher les deps.
#' @param version ajout de la version pour les deps
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_dsfr_deps <- function(tag, version = get_dsfr_version()) {
  all_deps <- list(dsfr = htmlDependency(
    name = "dsfr",
    version = version,
    src = c(file = paste0("dsfr-v", version)),
    stylesheet = "dist/dsfr.min.css",
    script = list(
      list(type = "module", src = "dist/dsfr.module.min.js"),
      list(type = "text/javascript", nomodule = NULL, src = "dist/dsfr.nomodule.min.js")
    ),
    package = "shinygouv",
    all_files = TRUE
  ),
  modal = htmlDependency(
    name = "modal",
    version = version,
    package = "shinygouv",
    src = c(file = "external_deps"),
    script = list(
      list(type = "text/javascript", src = "shiny-compat.js")
    ),
    all_files = TRUE
  ),
  spinner_deps = htmlDependency(
    name = "spinner",
    version = version,
    src = c(file = "external_deps"),
    stylesheet = "spinner.css",
    script = "spinner.js",
    package = "shinygouv",
    all_files = TRUE
  )
  )

  tagList(tag, all_deps, addWithSpinner())

}

#' @import htmltools
tags <- htmltools::tags
