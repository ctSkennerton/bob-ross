library(shiny)
library(dplyr)
library(readr)
data <- read_csv("data/elements-by-episode.csv")

createLink <- function(val, link) {
  ifelse(is.na(link), 
    val,  
    sprintf('<a href="%s" target="_blank">%s</a>',link, val)
  )
}

shinyServer(function(input, output, session) {
  
  updateSelectizeInput(session, 'i1', choices = names(data)[-c(1,2)], server = TRUE)
  output$display_table <- renderDataTable({
    conditions <- NULL
    if(! is.null(input$i1)) {
      conditions <- paste(input$i1, "== 1", collapse = " & ")
    }
    filter_(data, .dots=conditions) %>% 
      select(EPISODE, TITLE, VIDEO_LINK) %>% 
      mutate(TITLE = createLink(TITLE, VIDEO_LINK)) %>%
      select(Episode = EPISODE, Title = TITLE)
  }, escape = FALSE)
})