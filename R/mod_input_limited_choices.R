#' input_limited_choices UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_input_limited_choices_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow_dsfr(
      column_dsfr(
        12,
        h3("Demo inputs \u00e0 choix limit\u00e9s"),
        # Adding space to the column
        # https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/espacement
        extra_class = "fr-my-6w"
      )
    ),
    fluidRow_dsfr(
      column_dsfr(
        12,
        tabSetPanel_dsfr(
          "tabsetpanel",
          tabPanel_dsfr(
            id = ns("tab1"),
            title = "checkboxInput_dsfr()",
            content = tagList(
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
                    inputId = ns("mycheckboxInput"),
                    label = "Une case \u00e0 cocher",
                    value = FALSE
                  )
                ),
                column_dsfr(
                  3,
                  textOutput(ns("outputcheckbox"))
                )
              ),
              fluidRow_dsfr(
                column_dsfr(
                  4,
                  actionButton_dsfr(
                    inputId = ns("updatelab_checkboxinput"),
                    label = "Mettre \u00e0 jour le label"
                  )
                ),
                column_dsfr(
                  4,
                  actionButton_dsfr(
                    inputId = ns("updateval_checkboxinput"),
                    label = "Mettre \u00e0 jour la valeur"
                  )
                )
              )

            )
          ),
          tabPanel_dsfr(
            id = ns("tab2"),
            title = "checkboxGroupInput_dsfr()",
            content = tagList(
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
                    inputId = ns("mycheckboxgroupInput"),
                    label = "Variables to show:",
                    choices = c(
                      "Cylinders" = "cyl",
                      "Transmission" = "am",
                      "Gears" = "gear"
                    )
                  )
                ),
                column_dsfr(
                  3,
                  textOutput(ns("outputcheckboxgroup"))
                )
              ),
              fluidRow_dsfr(
                actionButton_dsfr(
                  inputId = ns("updateval_checkboxGroupInput"),
                  label = "Mettre \u00e0 jour la valeur et passer en inline = TRUE "
                ),
                actionButton_dsfr(
                  inputId = ns("updatelab_checkboxGroupInput"),
                  label = "Mettre \u00e0 jour le label "
                )
              )
            )
          )
        )
      )
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        tabSetPanel_dsfr(
          "tabsetpanel2",
          tabPanel_dsfr(
            id = ns("tab3"),
            title = "radioButtons_dsfr()",
            content = tagList(
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
                    inputId = ns("espece"),
                    label = "Especes",
                    choices = c("Setosa" = "setosa", "Versicolor" = "versicolor"),
                    class = NULL,
                    inline = FALSE
                  ),
                  extra_class = "fr-m-1w"
                ),
                column_dsfr(
                  6,
                  textOutput(
                    ns("outputespece")
                  ),
                  extra_class = "fr-m-1w"
                )
              ),
              fluidRow_dsfr(
                actionButton_dsfr(
                  inputId = ns("updateval_radioButton"),
                  label = "Mettre \u00e0 jour la valeur et passer en inline = TRUE "
                ),
                actionButton_dsfr(
                  inputId = ns("updatelab_radioButton"),
                  label = "Mettre \u00e0 jour le label "
                )
              )
            )
          ),
          tabPanel_dsfr(
            id = ns("tab4"),
            title = "radioGroupButtons_dsfr()",
            content = tagList(
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
                    inputId = ns("espece_radiogroupbutton"),
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
                    ns("outputespece_radiogroupbutton")
                  ),
                  extra_class = "fr-m-1w"
                )
              ),
              fluidRow_dsfr(
                column_dsfr(
                  4,
                  actionButton_dsfr(
                    inputId = ns("update_radiogroupbutton_label"),
                    label = "Mettre \u00e0 jour le label"
                  )
                ),
                column_dsfr(
                  4,
                  actionButton_dsfr(
                    inputId = ns("update_radiogroupbutton_choices"),
                    label = "Mettre \u00e0 jour les choix"
                  )
                ),
                column_dsfr(
                  4,
                  actionButton_dsfr(
                    inputId = ns("update_radiogroupbutton_selected"),
                    label = "Mettre \u00e0 jour la valeur s\u00e9lectionn\u00e9e"
                  )
                )
              ),
              tags$br(),
              tags$hr(),
              fluidRow_dsfr(
                column_dsfr(
                  6,
                  radioGroupButtons_dsfr(
                    inputId = ns("espece_radiogroupbutton2"),
                    label = "Especes (radio group button avec inline = FALSE)",
                    choices = c("Virginica" = "virginica", "Versicolor" = "versicolor", "Setosa" = "setosa"),
                    inline = FALSE
                  ),
                  extra_class = "fr-m-1w"
                ),
                column_dsfr(
                  6,
                  textOutput(
                    ns("outputespece_radiogroupbutton2")
                  ),
                  extra_class = "fr-m-1w"
                )
              )
            )
          )
        )
      )
    ),

    tags$br(),
    tags$hr(),

    fluidRow_dsfr(
      column_dsfr(
        12,
        tabSetPanel_dsfr(
          "tabsetpanel3",

          tabPanel_dsfr(
            id = ns("tab5"),
            title = "toggleSwitch_dsfr()",
            content = tagList(
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
                    inputId = ns("toggleswitch"),
                    label = "Toggle Switch",
                    activate = "Activ\u00e9",
                    deactivate = "D\u00e9sactiv\u00e9"
                  ),
                  verbatimTextOutput(
                    outputId = ns("toggleswitchvalue")
                  ),
                  actionButton_dsfr(
                    inputId = ns("updatetoggleswitch"),
                    label = "Mettre \u00e0 jour le toggle switch"
                  )
                )
              )
            )
          ),
          tabPanel_dsfr(
            id = ns("tab6"),
            title = "selectInput_dsfr()",
            content = tagList(
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
                    inputId = ns("selectinput"),
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
                    inputId = ns("updateselectinput"),
                    label = "Mettre \u00e0 jour le label"
                  )
                ),
                column_dsfr(
                  4,
                  extra_class = "fr-my-6w",
                  actionButton_dsfr(
                    inputId = ns("updateselectinput2"),
                    label = "Mettre \u00e0 jour les choix"
                  )
                ),
                column_dsfr(
                  4,
                  extra_class = "fr-my-6w",
                  actionButton_dsfr(
                    inputId = ns("updateselectinput3"),
                    label = "Mettre \u00e0 jour l\'option s\u00e9lectionn\u00e9e"
                  )
                )
              )

            )
          )
        )
      )
    )
  )

}

#' input_limited_choices Server Functions
#'
#' @noRd
mod_input_limited_choices_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    r_local <- reactiveValues(
      choices = LETTERS[1:10]
    )

    ## checkboxinput
    output$outputcheckbox <- renderText({
      paste("Valeur du checkbox :", input$mycheckboxInput)
    })

    observeEvent(input$updatelab_checkboxinput, {
      updateCheckboxInput_dsfr(
        session = session,
        inputId = "mycheckboxInput",
        label = sample(r_local$choices, 1)
      )
    })

    observeEvent(input$updateval_checkboxinput, {
      updateCheckboxInput_dsfr(
        session = session,
        inputId = "mycheckboxInput",
        value = !input$mycheckboxInput,
      )
    })

    ## checkboxgroupinput
    output$outputcheckboxgroup <- renderText({
      paste("Valeur du checkboxgroup :", paste0(input$mycheckboxgroupInput, collapse = " "))
    })

    observeEvent(input$updatelab_checkboxGroupInput, {
      updateCheckboxGroupInput_dsfr(
        session = session,
        inputId = "mycheckboxgroupInput",
        label = sample(r_local$choices, 1)
      )
    })


    observeEvent(input$updateval_checkboxGroupInput, {
      updateCheckboxGroupInput_dsfr(
        session = session,
        inputId = "mycheckboxgroupInput",
        choices = sample(r_local$choices, 3),
        inline = TRUE
      )
    })

    ## radioButtons
    output$outputespece <- renderText({
      paste("Esp\u00e8ce :", input$espece)
    })

    observeEvent(input$updatelab_radioButton, {
      updateRadioButtons_dsfr(
        session = session,
        inputId = "espece",
        label = sample(r_local$choices, 1)
      )
    })


    observeEvent(input$updateval_radioButton, {
      updateRadioButtons_dsfr(
        session = session,
        inputId = "espece",
        choices = sample(r_local$choices, 3),
        inline = TRUE
      )
    })

    ## radioGroupButtons
    output$outputespece_radiogroupbutton <- renderText({
      paste("Esp\u00e8ce radiogroupbutton :", input$espece_radiogroupbutton)
    })

    output$outputespece_radiogroupbutton2 <- renderText({
      paste("Esp\u00e8ce radiogroupbutton :", input$espece_radiogroupbutton2)
    })


    observeEvent(input$update_radiogroupbutton_label, {
      updateRadioGroupButtons_dsfr(
        inputId = "espece_radiogroupbutton",
        label = paste0(sample(LETTERS, size = 12), collapse = ""),
        session = session
      )
    })

    observeEvent(input$update_radiogroupbutton_choices, {
      r_local$radiogroupubutton_choices <- sapply(1:5, function(x) paste0(sample(LETTERS, size = 3), collapse = ""))

      updateRadioGroupButtons_dsfr(
        inputId = "espece_radiogroupbutton",
        choices = r_local$radiogroupubutton_choices,
        session = session,
        inline = TRUE
      )
    })

    observeEvent(input$update_radiogroupbutton_selected, {
      updateRadioGroupButtons_dsfr(
        inputId = "espece_radiogroupbutton",
        selected = sample(r_local$radiogroupubutton_choices, size = 1),
        session = session
      )
    })


    ## toggle switch
    output$toggleswitchvalue <- renderText({
      paste0("La valeur du toggleSwitch est ", input$toggleswitch)
    })

    observeEvent(input$updatetoggleswitch, {

      value_activate <- sample(r_local$choices, 1)
      value_deactivate <- sample(r_local$choices, 1)

      updateToggleSwitch_dsfr(
        session = session,
        inputId = "toggleswitch",
        value = sample(c(TRUE, FALSE), 1),
        label = sample(r_local$choices, 1),
        activate = value_activate,
        deactivate = value_deactivate
      )
    })

    ## selectinput
    observeEvent(input$updateselectinput, {
      updateSelectInput_dsfr(
        inputId = "selectinput",
        label = paste(sample(letters, 10), collapse = "")
      )
    })

    observeEvent(input$updateselectinput2, {
      r_local$choices <- sample(c(LETTERS[1:10], letters[1:10]), 10)
      updateSelectInput_dsfr(
        inputId = "selectinput",
        choices = r_local$choices
      )
    })

    observeEvent(input$updateselectinput3, {
      updateSelectInput_dsfr(
        inputId = "selectinput",
        selected = sample(r_local$choices, 1)
      )
    })


  })
}

## To be copied in the UI
# mod_input_limited_choices_ui("input_limited_choices_1")

## To be copied in the server
# mod_input_limited_choices_server("input_limited_choices_1")
