#' Function to test for update inputs
#' From {shiny} unit tests: test-update-input.R
createModuleSession <- function(moduleId) {
  session <- as.environment(list(
    ns = NS(moduleId),
    sendInputMessage = function(inputId, message) {
      session$lastInputMessage <- list(id = inputId, message = message)
    }
  ))
  class(session) <- "ShinySession"
  session
}
