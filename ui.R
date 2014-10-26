shinyUI(fluidPage(
    titlePanel("Education and Related Statistics for the U.S. States (1992)"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Education Statistics by State from States {car} dataset.
                     Source: United States (1992) Statistical Abstract of the United States. Bureau of the Census."),
            
            selectInput("var", 
                        label = "Choose a statistic to display",
                        choices = c("Average Verbal SAT", "Average Math SAT",
                                    "Percentage of graduating high school students who took the SAT",
                                    "Spending on public education per student",
                                    "Average teacher's salary (in $1000s)"),
                        width = "100%",
                        selected = "Average Verbal SAT"),
            
            uiOutput("rangeSelect")
        ),
        
        mainPanel(plotOutput("map"))
    )
))