# Lucas Audette
# INFO 498f
# 2-2-16

library(plotly)
library(dplyr)

# Produces an output variable "plot" which displays an interactive plot for
# the iris built-in dataset.
shinyServer(function(input, output) {
  data <- iris
  
  # Renders plot
  output$plot <- renderPlotly({
    
    # Checks which species box is checked
    if(input$species != "all") {
      data <- filter(iris, grepl(input$species, data$Species))
    }
    
    x <- list(title = paste(input$type, "Width"))
    y <- list(title = paste(input$type, "Length"))
    
    # plot with measurement user input taken into account 
    p <- plot_ly(data,
                 x = eval(parse(text = paste0(input$type, ".Width"))), 
                 y = eval(parse(text = paste0(input$type, ".Length"))), 
                 mode = "markers", 
                 text = paste("Species:", Species), 
                 color = Species) %>%
    layout(xaxis = x,
           yaxis = y,
           hovermode = "closest")
    
    # Execute plot
    p
  })
})