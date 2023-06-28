version_ <- "1.9.3"

if (any(grepl(x = list.dirs("inst/", recursive = FALSE), pattern = version_))) {
    return("il faut copier dans inst la bonne version du dsfr")
} else {
    ## nettoyer les dossiers
    name_dir <- file.path("inst", paste0("dsfr-v", version_))
    dirs_ <- list.dirs(name_dir, recursive = FALSE)
    remove_dir <- dirs_[!grepl(pattern = "dist|i18n", x = dirs_)]
    unlink(remove_dir, recursive = TRUE)

    ## nettoyer dist

    dist_ <- file.path(name_dir, "dist")

    all_files_css_js <- list.files(
        dist_, full.names = TRUE
    )
    to_be_removed <- all_files_css_js[!grepl(x = all_files_css_js, pattern = "favicon$|fonts$|icons$|pattern$|utility$|core$|dsfr\\.min\\.css$|dsfr\\.module\\.min\\.js$|dsfr\\.nomodule\\.min\\.js$|dsfr\\.legacy\\.css$")]
    unlink(to_be_removed, recursive = TRUE)

    dir_shiny <- paste0("inst/", "v", version_)
    last_version <- desc::desc_get("VersionDsfr")
    if (last_version != paste0("v", version_)) {
        fs::dir_copy(path = paste0("inst/v", last_version),
            new_path = paste0("inst/v", version_))
    }
}
