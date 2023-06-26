message("--- Add server ---\n")

options("repos" = "https://packagemanager.posit.co/cran/__linux__/jammy/latest")

install.packages("remotes")
install.packages("pak")
remotes::install_deps()
remotes::install_local()

## Forcing the install of some packages because it
## doesn't work on the CI for unidentified reasons

pak::pak(
  c("cpp11", "hms", "progress"),
  repos = "https://cran.rstudio.com",
  dependencies = TRUE
)

message("--- Add server ---\n")

rsconnect::setAccountInfo(
  name = Sys.getenv("SHINYAPPS_NAME"),
  token = Sys.getenv("SHINYAPPS_TOKEN"),
  secret = Sys.getenv("SHINYAPPS_SECRET")
)

message("--- Deploying app ---\n")
appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|deliverables|dev|data-raw|docker", appFiles)]

rsconnect::deployApp(
  appDir = ".",
  account = Sys.getenv("SHINYAPPS_NAME"),
  appFiles = appFiles,
  appName = Sys.getenv("NAME_OF_APP"),
  lint = FALSE
)
