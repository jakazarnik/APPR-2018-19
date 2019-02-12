library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Gostota prebivalcev po statisticnih regijah"),
  
  tabsetPanel(
    tabPanel("Statististicna regija",
             sidebarPanel(
               selectInput("regija", "Izberi regijo",
                           sort(unique(starostne_skupine$regija)))
               ),
             mainPanel(plotOutput("gostota"))
))))

