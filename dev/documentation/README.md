Guide du développeur
================

Vous trouverez ici l’ensemble des informations nécéssaires pour
développer le package.

## Workflow a suivre avant de dev sur le projet :

-   Ajouter le template de commit :

<!-- -->

    git config --local commit.template .github/template_commit

Et suivre cette convention pour les commits et les tags :

-   Un mot clé en début de message pour dire le principal objectif de ce
    commit.
-   Une ligne `tags` qui reprend les mots clés pour ce qui est fait dans
    le commit

Voici un exemple :

    feat: ma feature de ouf

    tags: feat, doc, test

    Why

    What

    Issues

Et voici la liste des tags possible :

    ci : tout ce qui touche au ci, meme les fix du ci pour l'instant
    fix : correction d'un bug dans la code base
    feat : l'ajout d'une nouvelle feature
    doc : doc du package, on devrait voir que ça la sur ces 3 jours en gros
    test: pour les tests unitaires
    style : pour la mise en forme de code
    chore: tout ce qui touche au projet en lui même, ne correspond pas à un feat ou un fix

## Workflow avant de commit

Pensez à executer les lignes suivantes du fichier
`dev/dev_history_package.R` :

``` r
# Utils for dev ----
# Get global variables
checkhelper::print_globals()
# styler the package
grkstyle::grk_style_pkg()
# linter
lintr::lint_package()
# bump version
desc::desc_bump_version("dev")
# Install
devtools::install(upgrade = "never")
# devtools::load_all()
devtools::check(vignettes = TRUE)
# ascii
stringi::stri_trans_general("é", "hex")
```
