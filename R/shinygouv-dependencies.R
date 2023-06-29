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
    stylesheet = c(
      "dist/dsfr.min.css",
      "dist/utility/utility.min.css"
    ),
    script = list(
      list(type = "module", src = "dist/dsfr.module.min.js"),
      list(type = "nomodule", src = "dist/dsfr.nomodule.min.js")
    ),
    package = "shinygouv",
    all_files = TRUE,
    head = '<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#000091">'
  ),

  modal = htmlDependency(
    name = "modal",
    version = version,
    package = "shinygouv",
    src = c(file = "external_deps"),
    script = list(
      list(type = "text/javascript", src = "shiny-compat.js"),
      list(type = "text/javascript", src = "navbarPage.js")
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

# navbarPage_deps <- function(
#   version = get_dsfr_version()
# ){
#   htmlDependency(
#     name = "navbarPage",
#     version = version,
#     package = "shinygouv",
#     src = c(file = "external_deps"),
#     script = list(
#       list(type = "text/javascript", src = "navbarPage.js")
#     ),
#     all_files = TRUE
#   )
# }

#' @import htmltools
tags <- htmltools::tags
