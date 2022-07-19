Guide du développeur
================

Ceci est un dossier de documentation dédié aux développeurs et
développeuses. Il contient les choix de mode de développement et tout
autre document qui ne s’adresserait pas directement aux utilisateurs.

## Workflow a suivre avant de dev sur le projet :

-   Ajouter le template de commit :

<!-- -->

    git config --local commit.template .github/template_commit

Et suivre cette convention pour les commits et les tags :

-   Un mot clé et un titre en début de message pour dire le principal objectif de ce
    commit.
-   Une ligne `tags` qui reprend les mots clés pour ce qui est fait dans
    le commit

Voici un exemple :

```
feat: ma fonctionnalité de ouf

# Tags possibles du plus au moins important :
Tags: ci, fix, feat, doc, test, style, chore

Pourquoi ?

Quoi ?
   
Tickets

```

Et voici la liste des tags possible dans l'ordre d'importance pour le choix du tag majeur dans le titre du commit :


    ci : tout ce qui touche au ci, meme les fix du ci pour l'instant
    fix : correction d'un bug dans la code base
    feat : l'ajout d'une nouvelle feature
    doc : doc du package, on devrait voir que ça la sur ces 3 jours en gros
    test: pour les tests unitaires
    style : pour la mise en forme de code
    chore: tout ce qui touche au projet en lui même, ne correspond pas à un feat ou un fix

## Les packages nécéssaires au developpement

En plus des dépendances du package, un ensemble de packages sera
nécessaire pour le bon developpement du package.

Vous retrouverez cette liste dans le fichier `dev/pkgs_deps.csv`.

## Workflow avant de commit

Pensez à executer les lignes suivantes du fichier
`dev/dev_history_package.R` :

``` r
# Utils for dev ----
# Recuperer les variables globales
checkhelper::print_globals()
# styler le package
grkstyle::grk_style_pkg()
# linter
lintr::lint_package()
# Incrementer le numero de version
desc::desc_bump_version("dev")
# Installer
devtools::install(upgrade = "never")
# devtools::load_all()
devtools::check(vignettes = TRUE)
```
