## Script pour deployer sur Connect avec le CI
# _Créer un token de déploiement dédié au projet pour le user générique sur Connect
# _Ajouter le token en variable privée masquée dans le dépot GitLab: CONNECT_TOKEN
# _Ajouter le nom d'utilisateur Connect en variable privée masquée dans le dépot GitLab: CONNECT_USER
# _Dans le projet GitLab Settings > CI/CD > Variables > Expand > Add variable
# _Attention : si vous cochez "Protected" au moment de la création de la variable, alors celle-ci ne sera active que pour les branches protégées
# _Ajouter la ligne suivante dans votre gitlab-ci.yml, après la création du pkgdown
#   __ Si c'est le pkgdown que vous voulez envoyer
# `        - Rscript "dev/dev_history_connect.R"`

# Ajouter aussi ces 2 variables d'environnement dans votre .Rprofile local
#  pour le premier envoi manuel sur Connect

# Un stage complet de CI peut-être (Attention avec les espaces, faire du LINT)
# Changer master par main si besoin

# connect:
#   stage: deploy-connect
#   dependencies:
#     - pages
#   only:
#     - main
#     - master
#     - test-ci
#   script:
#   # To uncomment if you want to deploy a ShinyApp from a {golem}
#   # - echo "Library path for packages :" $R_LIBS
#   # - mkdir -p $R_LIBS
#   # - Rscript 'install.packages("remotes")'
#   # - Rscript -e 'remotes::install_local(upgrade = "never", dependencies = TRUE)'
#     - Rscript "dev/dev_history_connect.R"
#   artifacts:
#     paths:
#     # This will download artifacts from previous jobs
#         - public
#     expire_in: 30 days

# Ne pas oublier d'ajouter le stage "deploy-connect"
# à la liste des stages du début du fichier gitlab-ci.yml
# Dans cet ordre

# stages:
#   - build
#   - test
#   - pkgdown
#   - pkgdown-move
#   - deploy
#   - deploy-connect

# /!\ => La premiere fois, executer en commentant le parametre "appID"
# Les fois suivantes, décommenter "appID" pour mettre le numéro de l'app sur Connect
# Choisir les paramètres ci-dessous en fonction de votre besoin

# Définir les droits de lecture de l'app sur Connect avec des individus et pas des groupes.
# Seuls les devs du projet et le client contact y ont accès

# Changer `mypackage` par le nom de votre package dans ce fichier

# Après le premier envoi manuel, définissez une url sur Connect directement
# pour avoir accès au site web - Ajuster les droits de lecture aussi
# Ensuite, mettez à jour le README pour dire où est le rapport de CI - pkgdown et coverage
# Doc and coverage

# - pkgdown: https://connect.thinkr.fr/mypackage-pkgdown-website/
# - coverage report: https://connect.thinkr.fr/mypackage-pkgdown-website/coverage.html


# Deps
install.packages("rsconnect")

## deploy shinyapp
# orgiwd <- setwd(".") # Uncomment here and below
## deploy pkgdown
# pkgdown::build_site()
if (dir.exists("public")) {
  origwd <- setwd("public")
} else {
  origwd <- setwd("docs")
}
print(paste("--", getwd(), "--"))

rsconnect::addServer("https://connect.thinkr.fr/__api__", name = "connect")
rsconnect::connectApiUser(account = Sys.getenv("CONNECT_USER"),
                          server = "connect", apiKey = Sys.getenv("CONNECT_TOKEN"))

# S'il y a {renv} dans votre projet, vous devrez probablement cacher quelques dossiers, par exemple
appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|deliverables|dev|data-raw|docker", appFiles)]

rsconnect::deployApp(
  ".",                          # the directory containing the content
  appName = "mypackage-pkgdown-website",
  appFiles = appFiles,          # the list of files to include as dependencies (all of them)
  appPrimaryDoc = "index.html", # the primary file for pkgdown
  # appPrimaryDoc = "app.R", # the primary file for shinyapp # Uncomment here
  # appId = 000, # Define when known
  account = Sys.getenv("CONNECT_USER"),
  server  = "connect",
  forceUpdate = FALSE
)

setwd(origwd)
