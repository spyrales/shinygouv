message("--- Add server ---\n")

options("repos" = "https://packagemanager.posit.co/cran/__linux__/jammy/latest")

install.packages("remotes")
install.packages("pak")
remotes::install_deps()
remotes::install_local()



message("--- Add server ---\n")

rsconnect::setAccountInfo(
  name = Sys.getenv("SHINYAPPS_NAME"),
  token = Sys.getenv("SHINYAPPS_TOKEN"),
  secret = Sys.getenv("SHINYAPPS_SECRET")
)

message("--- Deploying app ---\n")
appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|dev|data-raw|docker|testthat|test.convert.dsfr", appFiles)]

rsconnect::deployApp(
  appDir = ".",
  account = Sys.getenv("SHINYAPPS_NAME"),
  appFiles = appFiles,
  appName = Sys.getenv("NAME_OF_APP"),
  lint = FALSE,
  forceUpdate = TRUE
)
