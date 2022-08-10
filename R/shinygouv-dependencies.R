#' ddsfr dependances
#'
#' Ajout le css et le js de dsfr
#'
#' @param tag element de la page pour attacher les deps.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_dsfr_deps <- function(tag) {
  dsfr_deps <- htmlDependency(
    name = "dsfr",
    version = "1.7.2",
    src = c(file = "dsfr-v1.7.2"),
    stylesheet = "dist/dsfr.min.css",
    script = list(
      list(type = "module", src = "dist/dsfr.module.min.js"),
      list(type = "text/javascript", nomodule = NULL, src = "dist/dsfr.nomodule.min.js")
    ),
    package = "shinygouv",
    all_files = TRUE
  )
  addResourcePath(prefix = "dsfr-v1.7.2", directoryPath = system.file("dsfr-v1.7.2", package = "shinygouv"))
  tagList(tag, dsfr_deps)
}

#' @import htmltools
tags <- htmltools::tags
