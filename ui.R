library(shiny)
library(ggplot2)

dataset <- mtcars

sampleSize<-nrow(dataset)

shinyUI(fluidPage(
  
  headerPanel("mtcars dataset Explorer"),
  
  fluidRow(
    mainPanel(
      HTML("In this simple application you will be able to create on-the-fly plots based on the mtcars dataset."),
      h4("The Dataset"),
      HTML("Follows a top 10 record sample of the mtcars dataset:"),
      verbatimTextOutput("top10"),
      h4("How To Create Your Own Plot"),
      HTML("You can interact with the plot located in the right panel by changing the input controls on the left. from top to bottom:"),
      tags$ul(
        tags$li("X: select the variable you want to display on the horizontal axis"), 
        tags$li("Y: Select the variable you want to display on the vertical axis"), 
        tags$li("Color: select the variable you want to use for colouring the points within the plotting area"),
        tags$li("Smooth: tick this checkbox if you want to add a smoothed conditional mean"),
        tags$li("Facet Row: select the variable you want to use to split up your data and plot the subsets (facets) of data together.")
      ),
      tags$hr(),
      h4("Let's Play!")
    )
  ),
  
  fluidRow(  
    sidebarPanel(
    
      selectInput('x', 'X', names(dataset)),
      selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
      selectInput('color', 'Color', c('None', names(dataset))),
      
      checkboxInput('smooth', 'Smooth'),
      
      selectInput('facet_row', 'Facet Row', c(None='.', names(dataset)))
    ),
  
    mainPanel(
      plotOutput('plot')
    )
  )
))
