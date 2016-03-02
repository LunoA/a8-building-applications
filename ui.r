# Lucas Audette
# INFO 498f
# 2-2-16

library(shiny)
library(plotly)
library(dplyr)

# Displays input options and resulting plot
shinyUI(fluidPage(
  
  # Page title
  titlePanel("Iris Dataset"),
  
  # Sidebar configuration
  sidebarLayout(
    
    # Side panel (widgets)
    sidebarPanel(
        
      # Species checkbox
      radioButtons("species", "Species:",
                   list("Setosa" = "set",
                        "Versicolor" = "ver",
                        "Virginica" = "vir",
                        "All" = "all"),
                   selected = "all"),
      br(),
      
      # Measurement checkbox
      radioButtons("type", "Measurement:",
                  list("Petal" = "Petal",
                       "Sepal" = "Sepal"),
                  selected = "Petal")
    ),
    
    # Main panel (plot)
    mainPanel(
      
      # Plot iris df based on user input
      plotlyOutput("plot")
    )
  )
))