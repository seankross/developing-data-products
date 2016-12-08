# ---- app3-server ----

library(shiny)

function(input, output){
  output$text <- renderText(input$slider1)
}