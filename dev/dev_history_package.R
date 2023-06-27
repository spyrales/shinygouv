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

## deps for dev ----
## Only for describe deps for developper
install.packages("remotes")
remotes::install_cran("attachment")
pkgs <- unique(
  c(
    attachment::att_from_rmds("dev"),
    attachment::att_from_rscripts("dev")
  )
)

remotes_or_not <- lapply(pkgs, function(x) {
  packageDescription(x)
}) %>%
  setNames(pkgs)

cran_or_not <- lapply(remotes_or_not, function(x) {
  try(x[["Repository"]], silent = TRUE)
}) %>%
  sapply(., is.null)

github_pkg <- names(cran_or_not[cran_or_not])
cran_pkg <- names(cran_or_not[!cran_or_not])
github_repo <- lapply(github_pkg, function(x) {
  desc <- remotes_or_not[[x]]
  tolower(paste(desc$RemoteUsername, desc$RemoteRepo, sep = "/"))
}) %>%
  setNames(github_pkg) %>%
  purrr::compact()

packages_and_deps <- rbind(
  data.frame(
    name_pkg = cran_pkg, cran = TRUE, remote = ""
  ),
  data.frame(
    name_pkg = names(github_repo), cran = FALSE, remote = unlist(github_repo)
  )
)

write.csv(x = packages_and_deps, "dev/pkgs_deps.csv")



# ==== Usually once ====
# Hide this file from build
usethis::use_build_ignore("dev")
usethis::use_build_ignore("ci/lib")
usethis::use_build_ignore("rsconnect")
usethis::use_git_ignore("docs/")
usethis::use_git_ignore("rsconnect/")
# usethis::create_package(".")

# Vaccinate for MacOS
usethis::git_vaccinate()
usethis::use_git_ignore(c(".DS_Store", ".Rproj.user", ".Rdata", ".Rhistory", ".httr-oauth"))

# Licence ----
# usethis::use_mit_license("ThinkR")


# Pipe ----
usethis::use_pipe()

# Data
dir.create("inst")
dir.create("inst/excel_files")

# Package quality ----

# _Tests ----
usethis::use_testthat()
usethis::use_test("app")

# GitHub Actions ----
usethis::use_readme_rmd()
usethis::use_github_action_check_standard()
usethis::use_github_action("pkgdown")
#  _Add remotes::install_github("ThinkR-open/thinkrtemplate") in this action
usethis::use_github_action("test-coverage")
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# _rhub
# rhub::check_for_cran()


# Documentation ----
# _Readme
# usethis::use_readme_rmd()
# CoC
usethis::use_code_of_conduct(contact = "juliette.engelaere-lefebvre@developpement-durable.gouv.fr")
# Contributing
usethis::use_tidy_contributing()

# _News
usethis::use_news_md()

# package-level documentation
usethis::use_package_doc()

# _Vignette
# usethis::use_vignette("ab-model")
devtools::build_vignettes()


# _Pkgdown - Pas besoin d'inclure le pkgdown pour un projet open-source avec un gh-pages
usethis::use_pkgdown()
# pkgdown::build_site() # pour tests en local
