# Deliverables ====

# Deliverables
dir.create("deliverables")
usethis::use_build_ignore("deliverables")
usethis::use_git_ignore("deliverables")

## Upgrade version Number in DESCRIPTION
usethis::use_version(which = c("major", "minor", "patch", "dev")[2])
## Update NEWS.md
rstudioapi::navigateToFile("NEWS.md")
## Create a commit for the version
## Add tag on version commit

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

## _pkgdown ----

## __Create gitdown ----
# => Create deliverable commit

# remotes::install_github("ThinkR-open/gitdown", upgrade = "never")
gitdown::git_down(
  pattern = c("Issues" = "#[[:digit:]]+"),
  author = "Sébastien Rochette, ThinkR; Murielle Delmotte, ThinkR; Cervan Girard, ThinkR",
  ref = "main")

# rmarkdown::render("gitdown/index.Rmd")

# Git issues names
library(gh)
library(purrr)
library(dplyr)
# gh_token()
issue_list <- gh(
  "/repos/:owner/:repo/issues",
  owner = "spyrales",
  repo = "shinygouv",
  state = "all", since = "2022-05-01T00:00:00Z",
  .limit = Inf)
issue_df <- issue_list %>%
  tibble(number = map_int(., "number"),
         id = map_int(., "id"),
         title = map_chr(., "title"),
         state = map_chr(., "state"),
         n_comments = map_int(., "comments"),
         opener = map_chr(., c("user", "login")),
         created_at = map_chr(., "created_at") %>% as.Date())
issue_df

my_pattern_table <- issue_df %>%
  mutate(
    pattern = paste0("#", number),
    title = paste(pattern, title)
  ) %>%
  select(pattern, title)

my_pattern_table
gitdown::git_down(
  pattern = c("Issues" = "#[[:digit:]]+"
  ),
  pattern.table = my_pattern_table,
  author = "Sébastien Rochette, ThinkR; Murielle Delmotte, ThinkR; Cervan Girard, ThinkR",
  ref = "main")

down_dir <- "deliverables/gitdown"
unlink(down_dir, recursive = TRUE)
file.copy("gitdown", "deliverables", recursive = TRUE)
unlink("gitdown", recursive = TRUE)

## __Create testdown ----
# remotes::install_github("ThinkR-open/testdown")
testdown::test_down()
down_dir <- "deliverables/testdown"
unlink(down_dir, recursive = TRUE)
file.copy("tests/testdown", "deliverables", recursive = TRUE)
unlink("tests/testdown", recursive = TRUE)

# _DockerFile and sources ----

# Create sources
usethis::use_git_ignore("deliverables/sources/")
dir.create("deliverables/sources")
devtools::build(path = "deliverables/sources/")

# END of deliverables ====
