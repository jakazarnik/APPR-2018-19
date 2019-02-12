library(shiny)

function(input, output) {
  
  output$gostota <- renderPlot({
    gostota_graf(input$regija)
  })
}