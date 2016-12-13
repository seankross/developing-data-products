# ---- app5-server ----

library(shiny)
library(minimap)

function(input, output) {
  output$region <- renderUI({
    if(input$country == "USA"){
      selectInput("state", "Which state do you live in?", choices = usa_abb)
    } else {
      selectInput("pt", "Which province or territory do you live in?", choices = canada_abb)
    }
  })
  
  output$message <- renderText({
    if(input$country == "USA"){
      paste0("You live in the USA in the state of ", input$state, ".")
    } else {
      paste0("You live in Canada in the province or territory of ", input$pt, ".")
    }
    
  })
}