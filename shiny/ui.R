library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Gostota prebivalcev statističnih regij"),
  
  tabsetPanel(
    tabPanel("Statististična regija",
             sidebarPanel(
               selectInput("regija", "Izberi regijo",
                           sort(unique(starostne_skupine$regija)))
               ),
             mainPanel(plotOutput("gostota1"))),
    
    tabPanel("Leto",
             sidebarPanel(
               sliderInput("leto", "Izberi leto", min=1995, max=2017,
                           value=1995, step=1, sep='', animate = 
                             animationOptions(interval = 250))
               ),
             mainPanel(plotOutput("gostota2")))
    )
  ))

