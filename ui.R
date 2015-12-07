library(shiny)
shinyUI(fluidPage(
  titlePanel("Finding the right Bob Ross"),
  h4("Searching for the episodes that speak to your heart"),
  sidebarLayout(
    sidebarPanel(
      helpText("start typing to select episodes that contain certain features"),
      selectizeInput('i1', NULL, NULL, multiple = TRUE),
      shiny::tags$small("many of the videos don't have links yet. You can help by adding them in at the", 
                        a("source repository", href="https://github.com/ctSkennerton/bob-ross")
                        )
    ),
    mainPanel(
      dataTableOutput("display_table")
    )
  )
))