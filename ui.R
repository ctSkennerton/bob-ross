library(shiny)
shinyUI(fluidPage(
  titlePanel("Finding the right Bob Ross"),
  h4("Searching for the episodes that speak to your heart"),
  sidebarLayout(
    sidebarPanel(
      helpText("start typing to select episodes that contain certain features"),
      selectizeInput(
      'i1', NULL, NULL, multiple = TRUE)
    ),
    mainPanel(
      dataTableOutput("display_table")
    )
  )
))