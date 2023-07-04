#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage_dsfr(
      title = "shinygouv",
      id = "nav",
      header = header_dsfr(
        intitule = "D\u00e9mo",
        officiel = "shinygouv",
        nom_site_service = "D\u00e9mo de {shinygouv}",
        baseline = "https://github.com/spyrales/shinygouv"
      ),
      # First tab
      navbarPanel_dsfr(
        title = "actionButton_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo actionButton_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              "go",
              label = "Un bouton avec un \u00e9!"
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "output1"
            ),
            extra_class = "fr-m-1w"
          )
        )
      ),
      # Second tab
      navbarPanel_dsfr(
        title = "radioButtons_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo radioButtons_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            4,
            radioButtons_dsfr(
              inputId = "espece",
              label = "Especes",
              choices = c("Setosa" = "setosa", "Versicolor" = "versicolor"),
              class = NULL,
              inline = TRUE
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "output2"
            ),
            extra_class = "fr-m-1w"
          )
        )
      ),
      # Third tab
      navbarPanel_dsfr(
        title = "modalDialog_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo modalDialog_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            6,
            actionButton_dsfr("show_modal", "Show modal dialog")
          ),
          column_dsfr(
            6,
            textOutput(
              "show_modal_n"
            )
          )
        )
      ),
      # Fourth tab
      navbarPanel_dsfr(
        title = "withSpinner_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo withSpinner_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            12,
            actionButton_dsfr(
              inputId = "showspinner",
              label = "Afficher le spinner pendant 5 secondes"
            )
          )
        )
      ),

      # Fifth tab
      navbarPanel_dsfr(
        title = "selectInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo selectInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            3,
            selectInput_dsfr(
              inputId = "selectinput",
              label = "Variable:",
              choices = c(
                "Cylinders" = "cyl",
                "Transmission" = "am",
                "Gears" = "gear"
              )
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "updateselectinput",
              label = "Mettre \u00e0 jour le label"
            )
          ),
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "updateselectinput2",
              label = "Mettre \u00e0 jour les choix"
            )
          ),
          column_dsfr(
            4,
            extra_class = "fr-my-6w",
            actionButton_dsfr(
              inputId = "updateselectinput3",
              label = "Mettre \u00e0 jour l\'option s\u00e9lectionn\u00e9e"
            )
          )
        )
      ),

      # Fifth tab
      navbarPanel_dsfr(
        title = "toggleSwitch_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo toggleSwitch_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            12,
            toggleSwitch_dsfr(
              inputId = "toggleswitch",
              label = "Toggle Switch",
              activate = "Activ\u00e9",
              deactivate = "D\u00e9sactiv\u00e9"
            ),
            verbatimTextOutput(
              outputId = "toggleswitchvalue"
            ),
            actionButton_dsfr(
              inputId = "updatetoggleswitch",
              label = "Mettre \u00e0 jour le toggle switch"
            )
          )
        )
      ),
      # Sixth tab
      navbarPanel_dsfr(
        title = "checkboxInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo checkboxInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            3,
            checkboxInput_dsfr(
              inputId = "mycheckboxInput",
              label = "Une case \u00e0 cocher",
              value = FALSE
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updatelab_checkboxinput",
              label = "Mettre \u00e0 jour le label"
            )
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updateval_checkboxinput",
              label = "Mettre \u00e0 jour la value "
            )
          )
        )
      ),
      # Seventh tab
      navbarPanel_dsfr(
        title = "checkboxGroupInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo checkboxGroupInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            3,
            checkboxGroupInput_dsfr(
              "mycheckboxgroupInput",
              "Variables to show:",
              c(
                "Cylinders" = "cyl",
                "Transmission" = "am",
                "Gears" = "gear"
              )
            )
          )
        ),
        fluidRow_dsfr(
          actionButton_dsfr(
            inputId = "updateval_checkboxGroupInput",
            label = "Mettre \u00e0 jour la value "
          ),
          actionButton_dsfr(
            inputId = "updatelab_checkboxGroupInput",
            label = "Mettre \u00e0 jour le label "
          )
        )
      ),

      # Seventh tab
      navbarPanel_dsfr(
        title = "numericInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo numericInput_dsfr()"),
            # Adding space to the column
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            12,
            numericInput_dsfr(
              inputId = "mynumericinput",
              label = "Numeric input",
              value = 12,
              min = 0,
              max = NA,
              step = 2
            ),
            verbatimTextOutput(
              outputId = "numericinputvalue"
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updatelab_checkboxGroupInput",
              label = "Mettre \u00e0 jour le label"
            )
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "updateval_checkboxGroupInput",
              label = "Mettre \u00e0 jour les choix "
            )
          )
        ),
        column_dsfr(
          12,
          actionButton_dsfr(
            inputId = "updateLabel",
            label = "updateLabel"
          ),
          actionButton_dsfr(
            inputId = "updateValue",
            label = "updateValue"
          ),
          actionButton_dsfr(
            inputId = "updateMin",
            label = "updateMin \u00e0 la valeur en cours -10"
          ),
          actionButton_dsfr(
            inputId = "updateMax",
            label = "updateMax \u00e0 la valeur en cours +10"
          ),
          actionButton_dsfr(
            inputId = "updateStep",
            label = "updateStep"
          )
        )
      ),
      # Eigth tab
      navbarPanel_dsfr(
        title = "tabSetPanel_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo checkboxInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            12,
            tabSetPanel_dsfr(
              "coucou",
              tabPanel_dsfr(
                id = "tab1",
                title = "Une prems tab",
                content = tagList(
                  h3("Coucou"),
                  numericInput(
                    inputId = "tabpaneln",
                    label = "Nombre de points sur le graph",
                    value = 100
                  ),
                  plotOutput("plot")
                )
              ),
              tabPanel_dsfr(
                id = "tab2",
                title = "Une deuxieme tab",
                content = tagList(
                  h3("Salut"),
                  numericInput(
                    inputId = "tabpaneln2",
                    label = "Nombre de points sur le plot",
                    value = 10
                  ),
                  plotOutput("plot2")
                )
              )
            )
          )
        )
      ),
      # Ninth tab
      navbarPanel_dsfr(
        title = "sliderInput_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo sliderInput_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            6,
            sliderInput_dsfr(
              inputId = "sliderinput",
              label = "Un slider",
              min = 0,
              max = 100,
              value = 50
            ),
            actionButton_dsfr(
              inputId = "updatesliderinput",
              label = "Mettre \u00e0 jour le slider"
            )
          ),
          column_dsfr(
            6,
            textOutput("sliderinputvalue")
          )
        )
      ),
      # Tenth tab
      navbarPanel_dsfr(
        title = "radioGroupButtons_dsfr()",
        fluidRow_dsfr(
          column_dsfr(
            12,
            h3("Demo radioGroupButtons_dsfr()"),
            # Adding space to the column
            # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
            extra_class = "fr-my-6w"
          ),
          column_dsfr(
            6,
            radioGroupButtons_dsfr(
              inputId = "espece_radiogroupbutton",
              label = "Especes (radio group button avec inline = TRUE)",
              choices = c("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica"),
              selected = "virginica",
              inline = TRUE
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "outputespece_radiogroupbutton"
            ),
            extra_class = "fr-m-1w"
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "update_radiogroupbutton_label",
              label = "Update label"
            )
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "update_radiogroupbutton_choices",
              label = "Update choices"
            )
          ),
          column_dsfr(
            4,
            actionButton_dsfr(
              inputId = "update_radiogroupbutton_selected",
              label = "Update selected"
            )
          )
        ),
        fluidRow_dsfr(
          column_dsfr(
            6,
            radioGroupButtons_dsfr(
              inputId = "espece_radiogroupbutton2",
              label = "Especes (radio group button avec inline = FALSE)",
              choices = c("Virginica" = "virginica", "Versicolor" = "versicolor", "Setosa" = "setosa"),
              inline = FALSE
            ),
            extra_class = "fr-m-1w"
          ),
          column_dsfr(
            6,
            textOutput(
              "outputespece_radiogroupbutton2"
            ),
            extra_class = "fr-m-1w"
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shinygouv"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
