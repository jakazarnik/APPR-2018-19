library(shiny)
library(DT)

shinyUI(fluidPage(
  
  titlePanel("Gostota prebivalcev po statisticnih regijah"),
  
  tabsetPanel(
    tabPanel("Statististicna regija",
             sidebarPanel(
               selectInput("regija", "Izberi regijo",
                           c("1","2"))
               )
               )
)))

