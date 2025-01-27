#' ddsfr dependances
#'
#' Ajout le css et le js de dsfr
#'
#' @param tag element de la page pour attacher les deps.
#' @param version ajout de la version pour les deps
#'
#' @importFrom htmltools tagList htmlDependency
#' @importFrom glue glue
#' @export
add_dsfr_deps <- function(tag, version = get_dsfr_version()) {
  dsfr_v_version <- paste0("dsfr-v",  version)
  dsfr_version <- paste0("dsfr-", version)
  dist_path <- paste0(dsfr_version, "/dist")
  favicon_head_tpl <- glue::glue('
  <link rel="apple-touch-icon" href="{dist_path}/favicon/apple-touch-icon.png"><!-- 180x180 -->
  <link rel="icon" href="{dist_path}/favicon/favicon.svg" type="image/svg+xml">
  <link rel="shortcut icon" href="{dist_path}/favicon/favicon.ico" type="image/x-icon"><!-- 32x32 -->
  <link rel="manifest" href="{dist_path}/favicon/manifest.webmanifest" crossorigin="use-credentials">
  ')
  all_deps <- list(
    dsfr = htmlDependency(
      name = "dsfr",
      version = version,
      src = c(file = dsfr_v_version),
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
      head = paste0('
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#000091">
      ', favicon_head_tpl)
    ),
    external = htmlDependency(
      name = "modal",
      version = version,
      package = "shinygouv",
      src = c(file = "external_deps"),
      stylesheet = c(
        "slider.css"
      ),
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
    ),
    daterangeinput_deps = htmlDependency(
      name = "daterangeinput",
      version = version,
      src = c(file = "external_deps"),
      script = list(
        list(type = "text/javascript", src = "daterange.js"),
        list(type = "text/javascript", src = "daterangeinputShinyCustomMessage.js")
      ),
      package = "shinygouv",
      all_files = TRUE
    ),
    radiogroupbutton_deps = htmlDependency(
      name = "radiogroupbuttons",
      version = version,
      src = c(file = "external_deps"),
      script = list(
        list(type = "text/javascript", src = "radiogroupbuttons.js"),
        list(type = "text/javascript", src = "radiogroupbuttonsShinyCustomMessage.js")
      ),
      stylesheet = c(
        "radiogroupbuttons.css"
      ),
      package = "shinygouv",
      all_files = TRUE
    ),
    tabsetpanel_deps = htmlDependency(
      name = "tabsetpanel",
      version = version,
      src = c(file = "external_deps"),
      script = list(
        list(type = "text/javascript", src = "updateTabsetPanel.js")
      ),
      package = "shinygouv",
      all_files = TRUE
    ),
    navlist_deps = htmlDependency(
      name = "navlistpanel",
      version = version,
      src = c(file = "external_deps"),
      stylesheet = "navlist.css",
      script = list(
        list(type = "text/javascript", src = "navlist.js"),
        list(type = "text/javascript", src = "updateNavlistPanel.js")
      ),
      package = "shinygouv",
      all_files = TRUE
    )
  )

  tagList(tag, all_deps, addWithSpinner())
}

#' @import htmltools
tags <- htmltools::tags
