# ---- app3-server ----

library(shiny)

shinyServer(function(input, output) {
  output$text <- renderText(input$slider1)
})