library(shiny)

shinyUI(fluidPage(
  uiOutput("title_panel"),
  
  sidebarLayout(
    sidebarPanel( 
      #uiOutput("numPlayers"),
      uiOutput("featuresUI"),
      br(),
      uiOutput("slider1UI"),
      br(),
      uiOutput("slider2UI"),
      br(),
      uiOutput("slider3UI"),
      br(),
      uiOutput("slider4UI"),
      br(),
      uiOutput("slider5UI"),
      br(),
      actionLink("about", "What's going on??")
    ),
    
    mainPanel(
      plotlyOutput("plotUI"),
      uiOutput("recUI"),
      tags$head(tags$script(HTML(
        paste0(
          '$(document).ready(function(){
                    $("#about")
                    .popover({html: true, 
                    title: "About this app", 
                    content: "', readChar("about.txt", file.info("about.txt")$size), 
          '", trigger: "click", placement: "bottom"
                    });
                    });'))))
    )
    
  )))