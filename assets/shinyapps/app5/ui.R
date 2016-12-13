# ---- app5-ui ----

library(shiny)

fluidPage(
  titlePanel("Dynamic UI"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("country", "Which Country do you live in?", 
                  choices = c("USA", "Canada")),
      uiOutput("region")
    ),
    
    mainPanel(
      textOutput("message")
    )
  )
)