library(shiny)
library(dplyr)
library(ggplot2)
library(shinylive)

ui <- fluidPage(
  titlePanel("My First Shimy App"),
  sidebarLayout(
    sidebarPanel(
      h1("Star Wars Characters"),
      sliderInput(
        inputId = "taille",
        label = "Height of characters",
        min = 0,
        max = 250,
        value = 30
      )
    ),
    mainPanel(
      plotOutput("StarWarsPlot")
    )
  )
)

server <- function(input, output) {
  output$StarWarsPlot <- renderPlot({
    starwars |>
    filter(height > input$taille) |>
             ggplot(aes(x = height)) +
             geom_histogram(
               binwidth =10,
               fill = "darkgray",
               color = "white"
             )
  })
}

shinyApp(ui = ui, server = server)
