# ---- app4-server ----

library(shiny)

function(input, output) {
  output$plot1 <- renderPlot({
    set.seed(2016-12-13)
    
    dataX <- runif(input$num_points, input$sliderX[1], input$sliderX[2])
    dataY <- runif(input$num_points, input$sliderY[1], input$sliderY[2])
    
    xlab <- ifelse(input$show_xlab, "X Axis", "")
    ylab <- ifelse(input$show_ylab, "Y Axis", "")
    main <- ifelse(input$show_title, "Title", "")
    
    plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main,
         xlim = c(-100, 100), ylim = c(-100, 100))
  })
}