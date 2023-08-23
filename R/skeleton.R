#' Trouve les chemins des fichiers du package shinygouv
#'
#' Renvoie les adresses absolues des fichiers presents dans le repertoire d'installation du package a partir de leur adresse relative.
#' @param ... Une ou plusieurs chaines de caracteres, representant les noms de fichiers ou repertoires a rechercher dans le package.
#' @return  Un chemin absolu.
#' @examples
#' shinygouv_file('rstudio', 'templates', 'project', 'ressources')
#'
#' @export
shinygouv_file <- function(...) {
  system.file(..., package = 'shinygouv', mustWork = TRUE)
}


#' Fonction de creation du repertoire du projet d'app conforme au dsfr de l'utilisateur
#'
#' A partir de la saisie des parametres par l'utilisateur, cette fonction peuple le repertoire de travail de l'utilisateur avec
#' l'app de demo .
#'
#' @param path Repertoire du projet de publication saisi par l'utilisateur.
#' @param ... Autres parametres saisis par l'utilisateur (a venir pour choisir structure UI ).
#' @return TRUE
#' @examples
#' \dontrun{
#'  shinygouv_skeleton("ma_nouvelle_app_golem_conforme_au_dsfr")
#' }
#'
#' @importFrom xfun read_utf8 write_utf8
#' @export
shinygouv_skeleton <- function(path,...) {

  # bloquer la creation si projet existant
  if(file.exists(path)) {
    message(paste0("le dossier '", path, "' existe deja\nveuillez le supprimer ou changer de nom de dossier\nRstudio ouvre l'ancien projet"))
  }

  else {

    # Creer le repertoire de travail
    dir.create(path, recursive = TRUE, showWarnings = FALSE)

    # recupérer les fichiers de l'app de demo
    appFiles <- list.files(shinygouv_file(""), recursive = TRUE, include.dirs = FALSE)
    appFiles <- appFiles[!grepl("renv|.git|.Rhistory|.Rproj.user|docs|config_.*.yaml||docker|testthat|test.convert.dsfr", appFiles)]
    appFiles <- appFiles[!grepl("CODE_OF_CONDUCT|", appFiles)]
# DESCRIPTION a vider
# inst à recreer


    # Copier le dossier 'ressources' vers le repertoire de travail utilisateur

    source <- file.path(resources, files)
    target <- file.path(path, files)
    file.copy(source, target)

    # Copier le dossier 'resources/extdata' vers le repertoire de travail utilisateur
    res_data <- propre.rpls_file('rstudio', 'templates', 'project', 'ressources', 'extdata')
    data_files <- list.files(res_data, recursive = FALSE, include.dirs = FALSE)
    source <- file.path(res_data, data_files)
    target <- file.path(path, "extdata", data_files)
    file.copy(source, target)


    # Ajouter le nom du projet utilisateur en tant que titre du bookdown dans _bookdown.yml
    f <- file.path(path, '_bookdown.yml')
    x <- xfun::read_utf8(f)
    xfun::write_utf8(c(sprintf('book_filename: "%s"', basename(path)), x), f)


    # Collecter les inputs utilisateurs et les assembler comme \"parametre: valeur"
    dots <- list(...)

    text <- lapply(seq_along(dots), function(i) {
      key <- names(dots)[[i]]
      val <- dots[[i]]
      paste0("  ", key, ": ", "\"",val, "\"")
    })

    # Gérer les types d analyses par epci en proposant une liste d'EPCI à adapter si choix 2

    if(grepl("2- ", dots$epci_ref)) {
      list_epci <- "  epci_list: !r c(\"244400404\",\"244400644\",\"244900015\",\"245300330\",\"247200132\",\"248500589\",\"200071678\",\"200071876\",\"244400610\",\"200071165\")"
    } else {
      list_epci <- "  "
    }

    # Assembler les parametres collectes dans une unique chaine de caracteres et declarer son encodage
    contents <- paste("params:",
                      paste(text, collapse = "\n"),
                      list_epci, sep = "\n")
    Encoding(contents) <- "UTF-8"


    # Injecter les parametres dans le fichier index.Rmd
    conn <- file.path(path,"index.Rmd")
    text <- xfun::read_utf8(conn)
    mytext <- c(text[1:8],contents,text[(8+1):length(text)])
    xfun::write_utf8(mytext, conn, sep="\n")

    # Injecter le logo
    reg <- dots$nom_region
    id_reg <- get_id_reg(nom_reg = reg)
    logo <- paste0("prefecture_r", id_reg)
    logo_file_path <- gouvdown::logo_file_path(logo)
    file_ext <- xfun::file_ext(logo_file_path)
    target_file <- paste("logo",file_ext,sep=".")
    target <- file.path(path, "www", target_file)
    file.copy(logo_file_path, target)
    content <- sprintf('        <li><a href="./"><img src="www/%s" width = "130"></a></li>', target_file)
    f <- file.path(path, "_output.yml")
    x <- xfun::read_utf8(f)
    output <- c(x[1:5], content, x[6:length(x)])
    xfun::write_utf8(output, f)

    # Injecter les css
    css_dir <- system.file("resources", "css", package = "gouvdown", mustWork = TRUE)
    css_files <- list.files(css_dir)
    source <- file.path(css_dir, css_files)
    target <- file.path(path, css_files)
    file.copy(source, target)

    # Injecter le mail de contact, le titre millésimé et la région de publication dans _output.yml
    mail <- propre.datareg::datareg(code_reg = id_reg)$courriel_contact
    complmt_reg <- propre.datareg::datareg(code_reg = id_reg)$en_de_nom_region
    f <- file.path(path, '_output.yml')
    x <- xfun::read_utf8(f)
    contents <- sprintf("         <li><a href='./'>Le parc social en %s</a></li>", dots[[1]]) # dots sont les paramètres utilisateurs, le premier est le millesime
    x[9] <- gsub("mailto:", paste0("mailto:", mail, "?Publication RPLS ", dots[[1]]), x[9])
    output <- c(x[1:6], contents, x[(5+3):length(x)])
    xfun::write_utf8(output, f)

    TRUE
  }
}
