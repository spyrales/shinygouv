Retour sur {shiny.dsfr}
================
2022-08-08

Le package {shiny.dsfr} disponible
[ici](https://gitlab-forge.din.developpement-durable.gouv.fr/dreal-pdl/csd/shiny.dsfr/-/tree/main/)
utilise {charpente} et reprend la structure “classique” d’un package qui
implémente une nouvelle interface utilisateur.

Cependant, cette méthode oblige le développeur à convertir le code HTML
fourni par le framework dsfr en R, pour ensuite devoir le retraduire en
html pour shiny.

Suite à la recommandation adoptée par le client, à savoir l’option D de
la vignette `Recommandation`, voici les différents points d’explication
sur la méthodologie complémentaire retenue par nos soins en comparaison
de {shiny.dsfr} :

-   Premièrement, nous privilégions une approche différente pour ce
    package en utilisant directement les codes html et htmlTemplate.
    L’avantage est de ne pas traduire le code html en R, la fonction
    htmlTemplate le fait pour nous. Cela permettra de maintenir
    seulement les différents fichiers `.html`. Ensuite, une batterie
    d’outils sera à disposition du développeur pour créer les fonctions
    qui exploiteront ces fichiers `html`.

-   Deuxièment, dans la mesure du possible, nous souhaiterions ne pas
    avoir à recoder les `inputs-bindings` de shiny. Pour cela, on
    réutilisera les classes déjà existantes dans {shiny}.

Néanmoins, nous allons nous inspirer du package {shiny.dsfr} qui apporte
une logique métier dans certains composants déjà implementés. Par
exemple, la gestion de la dépendance avec {bootstrap}. Autrement dit,
nous allons reprendre le travail déjà réalisé par Jean-Daniel Lomenede
en remplaçant le code {shiny} par des html templates.
