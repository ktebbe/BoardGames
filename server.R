library(shiny)
library(plotly)
source("functions.R", local=TRUE)

shinyServer(function(input, output, session) {

  output$featuresUI <- renderUI({
    selectInput("features", label = "Choose the game features:",
                   multiple = T, 
                choices = c("Randomness" = "Random", 
                            "Interactivity" = "Social", 
                            "Learning Difficulty" = "Learning",
                            "Length of Gameplay" = "Time", 
                            "Paths to Victory" = "Paths"))
    
  })
  
  output$slider1UI <- renderUI({
    if(is.null(input$features[1])) return(NULL)
    sliderInput("slider1", label = tab$Scale[tab$Feature == input$features[1]],
                min = -5, max = 5, value = 0, step = .5)
    
  })
  output$slider2UI <- renderUI({
    if(length(input$features) < 2) return(NULL)
    sliderInput("slider2", label = tab$Scale[tab$Feature == input$features[2]],
                min = -5, max = 5, value = 0, step = .5)
    
  })
  output$slider3UI <- renderUI({
    if(length(input$features) < 3) return(NULL)
    sliderInput("slider3", label = tab$Scale[tab$Feature == input$features[3]],
                min = -5, max = 5, value = 0, step = .5)
    
  })
  output$slider4UI <- renderUI({
    if(length(input$features) < 4) return(NULL)
    sliderInput("slider4", label = tab$Scale[tab$Feature == input$features[4]],
                min = -5, max = 5, value = 0, step = .5)
    
  })
  output$slider5UI <- renderUI({
    if(length(input$features) < 5) return(NULL)
    sliderInput("slider5", label = tab$Scale[tab$Feature == input$features[5]],
                min = -5, max = 5, value = 0, step = .5)
    
  })
  ###############
  output$plotUI <- renderPlotly({
    ### color the recomended 5 in red!!!! 
    if(length(input$features) != 2) return(NULL)
    # plot(ratings[,input$features[1]], ratings[,input$features[2]],
    #      xlab = tab$Scale[tab$Feature == input$features[1]], 
    #      ylab = tab$Scale[tab$Feature == input$features[2]])
    
    #plot_ly(data = ratings, x = ~input$features[1], y = ~input$features[2], type = "scatter")
    plot_ly(data = ratings, x = ~Random, y = ~Social, type = "scatter")
    
  })
  


})