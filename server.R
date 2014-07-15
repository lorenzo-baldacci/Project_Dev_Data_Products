library(shiny)
library(ggplot2)

count <- 0

shinyServer(function(input, output) {
  
  output$plot <- reactivePlot(function() {
    if (count<6){
      p <- ggplot(mtcars, aes_string(x=input$x, y=input$y)) + geom_point() + ggtitle(paste("This is your plot no:",count))
      count<<-count+1
      if (input$color != 'None')
        p <- p + aes_string(color=input$color)
      
      facets <- paste(input$facet_row, '~ .')
      if (facets != '. ~ .')
        p <- p + facet_grid(facets)
      
      if (input$smooth)
        p <- p + geom_smooth()
      
      print(p)
    }else{
      p <- ggplot(mtcars, aes_string(x=input$x, y=input$y)) + geom_blank() + ggtitle("Unfortunately your session has expired.")
      print(p)
    }
  }, height=700)

  output$top10 <- renderPrint({head(mtcars, n = 10)})  

})