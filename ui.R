library(shiny)
library(ggplot2)

dataset <- mtcars

sampleSize<-nrow(dataset)

shinyUI(fluidPage(
  
  headerPanel("mtcars dataset Explorer"),
  
  fluidRow(
    mainPanel(
      HTML("In this simple application you will be able to create on-the-fly plots based on the mtcars dataset."),
      h4("Summary"),
      verbatimTextOutput("summary")
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
