# Try installation from GitLab ----
if (!requireNamespace("git2r")) { install.packages("git2r")}

username <- rstudioapi::showPrompt("username", "Please enter your git username:", "name")
password <- rstudioapi::askForPassword()
remotes::install_gitlab(
  repo = "https://forge.thinkr.fr/thinkr/missions/<project>",
  credentials = git2r::cred_user_pass(username, password))

# Deliverables ====
# _renv data - If you deliver a package with a project inside ----
rstudioapi::navigateToFile("dev/flat_project.Rmd")

# Deliverables
dir.create("deliverables")
usethis::use_build_ignore("deliverables")
usethis::use_git_ignore("deliverables")

## Upgrade version Number in DESCRIPTION
usethis::use_version(which = c("major", "minor", "patch", "dev")[2])
## Upgrade version number in README and knit
rstudioapi::navigateToFile('README.Rmd')
# rstudioapi::navigateToFile("inst/rsproject/README.md")
## Update NEWS.md
rstudioapi::navigateToFile("NEWS.md")
## Create a commit for the version
## Add tag on version commit

## Update description files in Shiny app
chameleon::create_pkg_biblio_file(
  to = "html",
  out.dir = "inst/app/www/about", edit = FALSE)
chameleon::create_pkg_desc_file(
  source = c("archive"),
  out.dir = "inst/app/www/about", to = "html", edit = FALSE)

## Update Readme using (and knit)
chameleon::create_pkg_desc_file(source = c("archive"),
                                out.dir = tempdir(), to = "raw",
                                edit = TRUE)

## _covr ----
x <- covr::package_coverage()
# Change {my-project}
covr::report(x, file = "deliverables/codecoverage/codecoverage-full-report.html")
# Add read information
file.copy(from = "dev/codecoverage_explanation.md",
          to = "deliverables", overwrite = TRUE)

## _add covrpage ----
# remotes::install_github("metrumresearchgroup/covrpage")
covrpage::covrpage(vignette = TRUE)
file.remove("tests/README.md")

## _add last_modif files ----
# remotes::install_github("ThinkR-open/gitdown")
gitdown::create_vignette_last_modif()
rstudioapi::navigateToFile("vignettes/modification_files.Rmd")

## _pkgdown ----
# remotes::install_github("ThinkR-open/chameleon")
# remotes::install_github("ThinkR-open/thinkrtemplate")
# remotes::install_github("r-lib/pkgdown", ref = "v1.3.0")
# chameleon::open_pkgdown_function(path = "docs")
devtools::install(upgrade = "never")
usethis::use_git_ignore("deliverables/pkgdown/")
usethis::use_git_ignore("pkgdown/")
chameleon::build_pkgdown(
  lazy = TRUE,
  yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
  favicon = system.file("pkgdown/favicon.ico", package = "thinkridentity"),
  move = TRUE, clean_before = TRUE, preview = FALSE
)
down_dir <- "deliverables/pkgdown"
unlink(down_dir, recursive = TRUE)
file.copy("inst/docs", "deliverables", recursive = TRUE)
file.rename("deliverables/docs", down_dir)
unlink("inst/docs", recursive = TRUE)
browseURL("deliverables/pkgdown/index.html")

## __Create gitdown ----
# => Create deliverable commit

# remotes::install_github("ThinkR-open/gitdown", upgrade = "never")
# remotes::install_github("ThinkR-open/gitdown", upgrade = "never", ref = "report-links")
# remotes::install_github("ThinkR-open/gitdown", upgrade = "never", ref = "add_history_files")
gitdown::git_down(
  pattern = c("Issues" = "#[[:digit:]]+"),
  author = "Sébastien Rochette, ThinkR; Margot Brard, ThinkR",
  ref = "master")

# rmarkdown::render("gitdown/index.Rmd")

# Git issues names
# Connect as a fixed user to a gitlab instance
# remotes::install_github("statnmap/gitlabr", upgrade = "never")
library(gitlabr)
library(dplyr)
my_project <- gl_project_connection(
  gitlab_url = "https://forge.thinkr.fr",
  project = 317, #repo.rtask",
  private_token = Sys.getenv("FORGE_THINKR_TOKEN")
)
my_project_issues <- my_project(gl_list_issues)

# install.packages("writexl")
writexl::write_xlsx(my_project_issues, "deliverables/issues_description.xlsx")

my_pattern_table <- my_project_issues %>%
  mutate(
    pattern = paste0("#", iid),
    title = paste(pattern, title)
  ) %>%
  select(pattern, title)

gitdown::git_down(
  pattern = c("Issues" = "#[[:digit:]]+"
  ),
  pattern.table = my_pattern_table,
  author = "Sébastien Rochette, ThinkR",
  ref = "add-project")
# ref = "origin/dev")

down_dir <- "deliverables/gitdown"
unlink(down_dir, recursive = TRUE)
file.copy("gitdown", "deliverables", recursive = TRUE)
unlink("gitdown", recursive = TRUE)

## __Create testdown ----
# remotes::install_github("ThinkR-open/testdown")
# remotes::install_github("ThinkR-open/testdown", ref = "escape-html")
testdown::test_down()
down_dir <- "deliverables/testdown"
unlink(down_dir, recursive = TRUE)
file.copy("tests/testdown", "deliverables", recursive = TRUE)
unlink("tests/testdown", recursive = TRUE)

## __Userguide as PDF ----
# Définition d'un dossier temporaire
my_tmp <- tempdir()

# Création des fichiers dans le dossier
thinkridentity::thinkR_pdf_create_header(
  path_here = my_tmp,
  author = "Sébastien Rochette",
  title = "ListOfCodes Userguide",
  description = "The userguide of the Shiny application",
  email = "contact@thinkr.fr",
  lang = "en"
)

# Création du PDF en ligne de commande
input <- "vignettes/cc-userguide.Rmd"
tmp_output <- "vignettes/temp.Rmd"
## _Amend YAML to add PDF options
thinkridentity::amend_yaml_pdf_output(
  input, output_file = tmp_output, lang = "en")
## _Render with output_options
rmarkdown::render(tmp_output,
                  output_dir = "deliverables",
                  output_file = "userguide.pdf",
                  output_format = "bookdown::pdf_book",
                  output_options =
                    list(toc = TRUE,
                         toc_depth = 3,
                         highlight = "tango",
                         includes = list(
                           before_body = file.path(my_tmp, "before_body.tex"),
                           in_header = file.path(my_tmp, "header.tex")),
                         keep_tex = FALSE,
                         number_sections = TRUE
                    )
)
## _Remove temporary Rmd
file.remove(tmp_output)
file.remove("vignettes/userguide.log")

# _DockerFile and sources ----
dir.create("deliverables/installation/")
# Verify Dockerfile in "deliverables/installation/Dockerfile"

usethis::use_git_ignore("deliverables/installation/Dockerfile_golem")
golem::add_dockerfile(
  output = "deliverables/installation/Dockerfile_golem",
  from = "rocker/verse:3.5.2"
)
unlink("R/app_config.R")
unlink("inst/golem-config.yml")
unlink(".dockerignore")
# _Set MRAN
# dockerlines <- readLines("deliverables/installation/Dockerfile")
#
# # Modify {golem} commit
# dockerlines[grep("golem", dockerlines)] <-
#   "RUN R -e 'remotes::install_github(\"ThinkR-open/golem@a4daea84f04de30cd80fe9fe80ce5afd74be87b3\")'"
#
# # New lines at the beginning
# addlines <- c(
# "# CRAN on: 14-01-2019",
# "RUN echo \"options(repos = list(CRAN = 'https://packagemanager.rstudio.com/cran/136'))\" >> /usr/local/lib/R/etc/Rprofile.site"
# )
#
# newdockerfile <- c(dockerlines[1], addlines, dockerlines[2:length(dockerlines)])
# writeLines(enc2utf8(newdockerfile), "deliverables/installation/Dockerfile")

# Create sources
usethis::use_git_ignore("deliverables/sources/")
dir.create("deliverables/sources")
devtools::build(path = "deliverables/sources/")

# Add sources along the Dockerfile for Shiny Apps
dir.create("deliverables/installation")
usethis::use_git_ignore("deliverables/installation/*.tar.gz")
file.remove(list.files("deliverables/installation", pattern = ".tar.gz", full.names = TRUE))
file.copy(tail(list.files("deliverables/sources", pattern = ".tar.gz", full.names = TRUE), 1),
          to = "deliverables/installation")

# Update installation guide with last version delivered
# Vignette: cc_installation_guide.Rmd

# END of deliverables ====


# Deploy {pkgdown} on rsconnect ----
usethis::use_git_ignore("docs/rsconnect")
usethis::use_git_ignore("inst/docs/rsconnect")
usethis::use_git_ignore("deliverables/pkgdown")
usethis::use_git_ignore("rsconnect")
usethis::use_build_ignore("rsconnect")

# install.packages("rsconnect")
rsconnect::accounts()
account_name <- rstudioapi::showPrompt("Rsconnect account", "Please enter your username:", "name")
account_server <- rstudioapi::showPrompt("Rsconnect server", "Please enter your server name:", "1.1.1.1")
# origwd <- setwd("inst/docs")
origwd <- setwd("deliverables/pkgdown")
rsconnect::deployApp(
  ".",                       # the directory containing the content
  appFiles = list.files(".", recursive = TRUE), # the list of files to include as dependencies (all of them)
  appPrimaryDoc = "index.html",                 # the primary file
  # appId = 484,
  appName = "listofcodes-pkg-doc",                   # name of the endpoint (unique to your account on Connect)
  appTitle = "listofcodes-pkg-doc",                  # display name for the content
  account = account_name,                # your Connect username
  server = account_server                    # the Connect server, see rsconnect::accounts()
)
setwd(origwd)


# Deploy app on connect
# Use the install from Git button if possible
rsconnect::writeManifest()

# Deploy App with {renv} on connect  ----
# Manually
appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|deliverables|dev|data-raw|docker", appFiles)]

rsconnect::writeManifest(appFiles = appFiles)

# Deploy App on rsconnect manually
rsconnect::accounts()
account_name <- rstudioapi::showPrompt("Rsconnect account", "Please enter your username:", "name")
account_server <- rstudioapi::showPrompt("Rsconnect server", "Please enter your server name:", "1.1.1.1")

appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|deliverables|dev|data-raw|docker", appFiles)]
rsconnect::deployApp(
  ".",                       # the directory containing the content
  appFiles = appFiles, # the list of files to include as dependencies (all of them)
  # appId = 478,
  appName = "app-diades.atlas",                   # name of the endpoint (unique to your account on Connect)
  appTitle = "app-diades.atlas",                  # display name for the content
  account = account_name,                # your Connect username
  server = account_server                    # the Connect server, see rsconnect::accounts()
)
