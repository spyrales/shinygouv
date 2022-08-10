
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinygouv

Reprendre le template existant pour le `Système de Design de l'Etat`
(DSFR)

# Comment utiliser le package :

Le package s’utilise comme {shiny}. Voici un exemple minimaliste pour la
partie UI:

``` r
library(shinygouv)

app_ui <- fluidPage_dsfr(
  title = "Exemple",
  fluidRow_dsfr(
    column_dsfr(0,
                shiny::p("Exemple colonne"))
  )
)
```

# Contribuer au package

Voir le README du dossier [documentation](dev/documentation)
