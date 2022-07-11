# Start {renv} the first time ====
renv::init()

# Set RENV cache ====
# Recommend setting a global variable: RENV_PATHS_CACHE
# With cache path where to store all R packages, between projects
# usethis::edit_r_environ(scope = "project")
# => Restart session
# => Tell all contributors to set this Environment variable

# Add the following lines to your .Rprofile in the project
#- On modifie le ".Rprofile" pour
#    - figer les depot CRAN et leur nom
#    - forcer l'utilisation du cache partagé {renv}
#    - mettre en adéquation les depot d'installation et ceux du renv.lock

# <!-- Rprofile STARTS -->
# Sourcing user .Rprofile if it exists
home_profile <- file.path(
  Sys.getenv("HOME"),
  ".Rprofile"
)
if (file.exists(home_profile)){
  source(home_profile)
}

options(renv.config.pak.enabled = TRUE)

# Fix CRAN version
source("renv/activate.R")
lock_ <- renv:::lockfile(file = "renv.lock")
#
if (grepl("ubuntu 18.04|debian 8", tolower(utils::osVersion))) {
  repos <- c("RSPM" = "https://packagemanager.rstudio.com/all/__linux__/bionic/latest",
             "thinkropen" = "https://thinkr-open.r-universe.dev",
             "CRAN" = "https://cran.rstudio.com")
} else if (grepl("ubuntu 20.04|debian 9", tolower(utils::osVersion))) {
  repos <- c("RSPM" = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
             "thinkropen" = "https://thinkr-open.r-universe.dev",
             "CRAN" = "https://cran.rstudio.com")
} else if (grepl("centos", tolower(utils::osVersion))) {
  # Important for MacOS users in particular
  repos <- c("RSPM" = "https://packagemanager.rstudio.com/all/__linux__/centos7/latest",
             "thinkropen" = "https://thinkr-open.r-universe.dev",
             "CRAN" = "https://cran.rstudio.com")
} else {
  # Important for MacOS and Windows users in particular
  repos <- c("CRAN" = "https://cran.rstudio.com",
             "RSPM" = "https://cran.rstudio.com",
             "thinkropen" = "https://thinkr-open.r-universe.dev")
}


lock_$repos(.repos = repos)
options(repos = repos)


lock_$write(file = "renv.lock")
rm(lock_)
rm(repos)


renv::activate()

# cache ----
# usethis::edit_r_environ(scope = "project")

renv::settings$use.cache(TRUE)

# Setting shiny.autoload.r to FALSE
options(shiny.autoload.r = FALSE)

# <!-- Rprofile ENDS -->



# ==> Restart RStudio Session <==



# You may need to verify renv.lock with:
# "Name": "REPO_NAME",
# "URL": "https://packagemanager.rstudio.com/all/latest"

# You may need to verify not empty
# Sys.getenv("RENV_PATHS_CACHE")

# Install from CRAN ----
install.packages("rstudioapi", repos = getOption("repos")["CRAN"])
install.packages("remotes", repos = getOption("repos")["CRAN"])
remotes::install_cran("devtools", repos = getOption("repos")["CRAN"])
# If needed --
# remotes::install_cran("golem", repos = getOption("repos")["CRAN"])
# remotes::install_cran("shiny", repos = getOption("repos")["CRAN"])
# Install from GitHub through r-universe first --
# remotes::install_cran("attachment", repos = getOption("repos")[c("thinkropen", "CRAN")])
remotes::install_cran("fusen", repos = getOption("repos")[c("thinkropen", "CRAN")])
remotes::install_cran("checkhelper", repos = getOption("repos")[c("thinkropen", "CRAN")])
remotes::install_cran("thinkrtemplate", repos = getOption("repos")[c("thinkropen", "CRAN")])


# git push / pull ====
## Ce qu'il faut avant d'envoyer sur le serveur
# install.packages("attachment", repos = getOption("repos")["thinkropen"])
# attachment::att_amend_desc(extra.suggests = c("bookdown"))
# attachment::create_dependencies_file()
attachment::att_amend_desc()
devtools::check()

# _renv
custom_packages <- c(
  attachment::att_from_description(),
  "renv", "utils",
  "devtools", "roxygen2", "usethis", "pkgload",
  "testthat", "covr", "attachment",
  "pkgdown", "styler", "checkhelper", "remotes", "fusen",
  # remotes::install_github("ThinkR-open/thinkrtemplate")
  "thinkrtemplate"
)
renv::snapshot(packages = custom_packages)

## After pull
renv::restore()
