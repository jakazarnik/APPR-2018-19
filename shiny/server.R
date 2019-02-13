library(shiny)

function(input, output) {
  
  output$gostota1 <- renderPlot({
    gostota_graf1(input$regija)
  })
  output$gostota2 <- renderPlot({
    gostota_graf2(input$leto)
  })
}