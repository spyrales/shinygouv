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
    version = "1.9.3",
    src = c(file = "dsfr-v1.9.3"),
    stylesheet = "dist/dsfr.min.css",
    script = list(
      list(type = "module", src = "dist/dsfr.module.min.js"),
      list(type = "text/javascript", nomodule = NULL, src = "dist/dsfr.nomodule.min.js"),
      list(type = "text/javascript", src = "dist/shiny-compat.js")
    ),
    package = "shinygouv",
    all_files = TRUE
  )


  modal_deps <- htmlDependency(
    name = "external_deps",
    version = "1.0.0",
    src = c(file = "external_deps"),
    script = list(
      list(type = "text/javascript", nomodule = NULL, src = "shiny_modal.js")
    ),
    package = "shinygouv",
    all_files = TRUE,
    head = HTML(
      ' <script src="shiny_modal.js"></script> '
    )
  )

  addResourcePath(prefix = "dsfr-v1.7.2", directoryPath = system.file("dsfr-v1.7.2", package = "shinygouv"))
  tagList(tag, dsfr_deps, modal_deps)
}

#' @import htmltools
tags <- htmltools::tags
