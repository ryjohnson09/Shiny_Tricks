#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)

material <- bs_theme(
    bg = "#202123", 
    fg = "#B8BCC2", 
    primary = "#EA80FC", 
    secondary = "#00DAC6",
    success = "#4F9B29",
    info = "#28B3ED",
    warning = "#FD7424",
    danger = "#F7367E",
    base_font = font_google("Open Sans"),
    heading_font = font_google("Proza Libre"),
    code_font = font_google("Fira Code")
)

# Define UI for application that draws a histogram
ui <- fluidPage(
    theme = material,

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
