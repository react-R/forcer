library(shiny)
library(forcer)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  forcerOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderForcer(
    forcer("Hello world!")
  )
}

shinyApp(ui, server)