# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################


# ==== Each time needed ====
# Dependencies ----
## Ce qu'il faut avant d'envoyer sur le serveur
# devtools::install_github("ThinkR-open/attachment")
# attachment::att_amend_desc(extra.suggests = c("bookdown"))
# attachment::create_dependencies_file()
attachment::att_amend_desc()
# Cela est normal : "Error in eval(x, envir = envir) : object 'db_local' not found"

devtools::build_readme()

check_n_covr <- function() {
    res <- devtools::check(args = c("--no-tests"))
    print(res)
    covr::package_coverage(type = "tests", quiet = TRUE)
}

check_n_covr()
# fusen::check_n_covr()

# Verifier que les md sont disponibles dans le dossier dev/documentation,
# sinon knit les Rmd en modifiant l'output par github_document

# Utils for dev ----
# Get global variables
checkhelper::print_globals()
# styler the package
# install.packages("grkstyle", repos = "https://gadenbuie.r-universe.dev")
grkstyle::grk_style_pkg(pkg = ".")
# linter
lintr::lint_package()
# bump version
desc::desc_bump_version("patch")
# Install
devtools::install(upgrade = "never")
# devtools::load_all()
devtools::check(vignettes = TRUE)
# ascii
stringi::stri_trans_general("è", "hex")
# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

# Documentation and dev ----
charpente::get_dependency_versions("@gouvfr/dsfr")

# Engineering: to do everytime
# => In dev/dev_history_package.R



# ==== To do once with {golem} ====
## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "name_of_module1", with_test = TRUE) # Name of the module
golem::add_module(name = "name_of_module2", with_test = TRUE) # Name of the module

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct("helpers", with_test = TRUE)
golem::add_utils("helpers", with_test = TRUE)

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file("script")
golem::add_js_handler("handlers")
golem::add_css_file("custom")
golem::add_sass_file("custom")

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
usethis::use_test("app")


## Vignette ----
usethis::use_vignette("shinygouv")
devtools::build_vignettes()

# You're now set! ----
# To deploy: go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")
