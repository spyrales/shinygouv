message("--- Deploy ---\n")

message("--- Add server ---\n")

rsconnect::setAccountInfo(name   = Sys.getenv("SHINYAPPS_NAME"),
                          token  = Sys.getenv("SHINYAPPS_TOKEN"),
                          secret = Sys.getenv("SHINYAPPS_SECRET"))
message("--- Deploying app ---\n")
rsconnect::deployApp(appDir = ".",appName = "shinygouv-demo")
