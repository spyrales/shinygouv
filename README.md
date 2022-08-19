
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {shinygouv}

Le package {shinygouv} permet d’utiliser le template existant pour le
`Système de Design de l'Etat` (DSFR) dans vos applications Shiny.

# Comment utiliser le package

Le package s’utilise comme {shiny}. Voici un exemple minimaliste pour la
partie UI:

``` r
library(shiny)
library(shinygouv)

app_ui <- fluidPage_dsfr(
  header = header_dsfr(
    intitule = "Intitule",
    officiel = "Officiel",
    nom_site_service = "Nom du site / service",
    baseline = "baseline - precisions sur l organisation",
    class = "fr-m-1w"
  ),
  title = "Exemple",
  fluidRow_dsfr(
    column_dsfr(0,
                shiny::p("Exemple colonne"))
  )
)
```

# Visualiser un application de démonstration comprenant les composants déjà implémentés:

[shinygouv-demo](https://ssm-ecologie.shinyapps.io/shinygouv-demo/)

# Contribuer au développement du package

Voir le README du dossier [documentation](dev/documentation)

# Code of Conduct

Please note that the {shinygouv} project is released with a Contributor
Code of Conduct. By contributing to this project, you agree to abide by
its terms.
