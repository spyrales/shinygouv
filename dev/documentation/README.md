Guide du développeur
================

Ceci est un dossier de documentation dédié aux développeurs et
développeuses. Il contient les choix de mode de développement et tout
autre document qui ne s’adresserait pas directement aux utilisateurs.

## Version du framework dsfr en cours de développement

Pour s’assurer du bon developpement du package `shinygouv`, il a été
ajouté au fichier `DESCRIPTION` la version du dsfr utilisé.

Pour connaître la version utilisée, vous pouvez lancer :

``` r
desc::desc_get("VersionDsfr")
```

    ## VersionDsfr 
    ##     "1.7.2"

Si il y a un changement de version du dsfr pour ce package, il faudra
alors penser à mettre à jour le fichier DESCRIPTION avec la commande
suivante :

``` r
desc::desc_set("VersionDsfr" = "1.7.2")
```

## Workflow à suivre avant de dev sur le projet :

### Ajouter le template de commit :

    git config --local commit.template .github/template_commit

### Suivre cette convention pour les commits et les tags :

-   Un mot clé et un titre en début de message pour dire le principal
    objectif de ce commit.
-   Une ligne `tags` qui reprend les mots clés pour ce qui est fait dans
    le commit

Voici un exemple :

    feat: ma fonctionnalité de ouf

    # Tags possibles du plus au moins important :
    Tags: ci, fix, feat, doc, test, style, chore

    Pourquoi ?

    Quoi ?
       
    Tickets

Et voici la liste des tags possible dans l’ordre d’importance pour le
choix du tag majeur dans le titre du commit :

    ci : tout ce qui touche au ci, meme les fix du ci pour l'instant
    fix : correction d'un bug dans la code base
    feat : l'ajout d'une nouvelle feature
    doc : doc du package, on devrait voir que ça la sur ces 3 jours en gros
    test: pour les tests unitaires
    style : pour la mise en forme de code
    chore : tout ce qui touche au projet en lui même, ne correspond pas à un feat ou un fix

### S’assurer d’avoir une issue à résoudre

-   Dans le cadre de l’ajout d’un nouveau composant, vous pouvez créer
    une issue avec le template d’issue “composant”
    -   Il se trouve sur GitHub à la création d’une issue, ou dans le
        package: “.github/ISSUE_TEMPLATE/composant.md”

### Développer dans une branche

-   Chaque développement se fait dans une nouvelle branche
    -   Elle est nommée à partir du numéro de l’issue à traiter
-   Les développements sont intégrés à la branche principale après
    demande de PR de votre branche vers la branche principale

## Comprendre et appliquer le workflow pour développer le package

Pour développer ce package, des choix techniques ont été adoptés. Vous
retrouverez les raisons [ici](explo_shiny.dsfr.md).

Le workflow se découpe en deux possibilités :

-   Les composants nécéssitant de la réactivité
-   Les composants sans réactivité

Ces deux possibilités se basent sur le même principe : **l’utilisation
des templates html**. La trame générale de ce workflow est définie dans
la documentation :

-   [Comment faire un composant
    shiny](comment-faire-un-composant-shiny.md)

Vous trouverez des exemples pour d’autres composants :

-   Avec réactivité:
    -   [radio buttons](radiobuttons-dsfr.md)
-   Sans réactivité:
    -   [Fluid page](fluidpage_dsfr.md)

N’hésitez pas à amender cette liste au fur et à mesure de vos
développements

## Les langues utilisées dans le projet

-   Rapports d’exploration (présentés en vignettes) : 🇫🇷
-   Vignettes utilisateurs: les vignettes qui expliquent comment
    utiliser les fonctions du package 🇫🇷
-   Contenu du Readme 🇫🇷
-   Documentation {roxygen2} des fonctions 🇫🇷
-   Messages de commit (de préférence en anglais, par habitude chez
    nous) 🇫🇷
-   Description des tests unitaires (de préférence en anglais) 🇫🇷
-   Code of Conduct: template par défaut de {usethis} en anglais déjà
    présent comme pour {gouvdown} 🇬🇧
-   Contributing: template par défaut de {usethis} en anglais peut être
    ajouté comme pour {gouvdown} 🇬🇧

## Les packages nécéssaires au developpement

En plus des dépendances du package, un ensemble de packages sera
nécessaire pour le bon developpement du package.

Vous retrouverez cette liste dans le fichier `dev/pkgs_deps.csv`.

## Workflow avant de commit

Pensez à executer les lignes “Each time needed” du fichier
`dev/dev_history_package.R` avant chaque commit.

``` r
rstudioapi::navigateToFile("dev/dev_history_package.R")
```
