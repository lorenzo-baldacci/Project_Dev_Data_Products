library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
    dataset <- reactive(function() {mtcars})
  
  output$plot <- reactivePlot(function() {
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    #     facets <- paste(input$facet_row, '~', input$facet_col)
    facets <- paste(input$facet_row, '~ .')
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  }, height=700)

  output$top10 <- renderPrint({head(mtcars, n = 10)})  
  
})