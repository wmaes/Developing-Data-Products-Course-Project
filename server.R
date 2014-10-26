# server.R

library(maps)
library(mapproj)
states <- readRDS("data/States.rds")
source("helpers.R")


shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            args <- switch(input$var,
                           "Average Verbal SAT" = list(states$SATV, "darkgreen", "Avg. Verbal"),
                           "Average Math SAT" = list(states$SATM, "black", "Avg. Math"),
                           "Percentage of graduating high school students who took the SAT" = list(states$percent, "darkblue", "Pct. taking SAT"),
                           "Spending on public education per student" = list(states$dollars, "darkorange", "Per student spending"),
                           "Average teacher's salary (in $1000s)" = list(states$pay, "darkviolet", "Avg. salary"))
            
            args$min <- input$range[1]
            args$max <- input$range[2]
            
            do.call(range_map, args)
        })
        
        range <- reactive({
            switch(input$var,
                   "Average Verbal SAT" = c(397, 511),
                   "Average Math SAT" = c(437, 577),
                   "Percentage of graduating high school students who took the SAT" = c(4, 74),
                   "Spending on public education per student (in $1000s)" = c(2993, 9159),
                   "Average teacher's salary (in $1000s)" = c(22, 43)
                   )
        })    
        output$rangeSelect <- renderUI({
            sliderInput("range", 
                        label = "Range of interest:",
                        min = range()[1], max = range()[2], value = range())
        })
    }
)