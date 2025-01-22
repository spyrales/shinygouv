# shinygouv 1.0.5  

## Composants  
* amélioration du style de sliderInput_dsfr  

## Fix  
* Fix déplacement indésirable des NavbarPages : un clic sur les items du menu déplaçait la vue sur le nom de l'onglet et masquait l'entête

# shinygouv 1.0.4

## Fix 
* numericInput_dsfr : correction du template qui ne fonctionnait plus avec shiny v1.8.1

# shinygouv 1.0.3

## Fix 

* modalDialog : correction du template pour permettre la fermeture des fenêtres si plusieurs modales ouvertes


# shinygouv 1.0.2

## Composants

* Ajout du `footer_dsfr()`
* Ajout de `fileInput_dsfr()`
* Ajout de la Marianne en favicon

## Chore

* Suppression de la dépendance à `stringr`

## Fix

* Correction de la classe du `fluidPage_dsfr()`  
* Les intitulé du bloc marque Marianne peuvent se mettre sur plusieurs lignes

## Doc

* Enrichissement de la doc utilisateur et développeur

# shinygouv 1.0.0

## Chore

* refactorisation de l'application de démonstration
  + passage en modules shiny
  + tri des composants par type
  
## Composants

* Ajout de `dateRangeInput_dsfr()` et `updateDateRangeInput_dsfr()`
* Ajout de `numericInput_dsfr()` et `updateNumericInput_dsfr()`
* Ajout de `navbarPage_dsfr()` et `navbarPanel_dsfr()`
* Ajout de `radioButtons_dsfr()` et `updateRadioButtons_dsfr()`
* Ajout de `radioGroupButtons_dsfr()` et `updateRadioGroupButtons_dsfr()`
* Ajout de `sliderInput_dsfr()` et `updateSliderInput_dsfr()`

## Doc

* Nettoyage du répertoire `dev/`
* Séparation de la documentation développeur et de la documentation utilisateur dans le répertoire `vignettes/`


# shinygouv 0.0.2 to 0.0.5

## Chore 

* ajout de la version 1.9.3 du dsfr
* suppression de la version 1.6.0 du dsfr
* correction problème encodage

## Composants

* Ajout de `modalDialog_dsfr()`
* Ajout de `withSpinner_dsfr()`
* Ajout de `selectInput_dsfr()` et `updateSelectInput_dsfr()`
* Ajout de `toggleSwitch_dsfr()`
* Ajout de `checkBoxInput_dsfr()` et `updateCheckboxInput_dsfr()`
* Ajout de `checkBoxGroupInput_dsfr()` et `updateCheckboxGroupInput_dsfr()`
* Ajout de `tabPanel()` et `tabsetPanel_dsfr()`

## Doc

* Suivi de l'implémentation d'un nouveau composant (ici `toggleSwitch_dsfr()`) à partir d'un [commit](https://github.com/spyrales/shinygouv/pull/82/commits/ed19c583c45aa04d9ebd51b1984851891e360b98)


# shinygouv 0.0.1

## Composants

* Ajout de `convert_to_dsfr()`.
* Ajout de `header_dsfr()`.
* Ajout de `fluidRow_dsfr()`.
* Ajout de `fluidPage_dsfr()`.
* Ajout de `radioButtons_dsfr()`.
* Ajout de `actionButton_dsfr()`.

## Versions du dsfr

* Ajout de la version v1.7.2 du dsfr
* Ajout de la version v1.6.0 du dsfr

## Guides

* Comment faire un composant
* Comment mettre à jour vers une nouvelle version du dsfr
* Inventaire des applications Shiny existantes
* Comparaison entre les différentes manières de créer un package de Design System

## Minor

* Added a `NEWS.md` file to track changes to the package.
