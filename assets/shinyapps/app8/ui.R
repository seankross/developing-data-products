# ---- app8-ui ----

library(shiny)

fluidPage(
  titlePanel("Brush Points to Visualize Model"),
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput("slopeOut"),
      h3("Intercept"),
      textOutput("intOut")
    ),
    mainPanel(
      plotOutput("plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
)