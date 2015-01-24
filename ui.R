library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Plot Noisy Data with a Line through It"),
  sidebarPanel(
    sliderInput('b', 'Intercept',value = 0, min = -10, max = 10, step = 0.05,),
    sliderInput('a', 'Slope',value = 1, min = -4, max = 6, step = 0.05,)
  ),
  mainPanel(
    plotOutput('newPlot'),
    h4("Instructions"),
    p("This app draws a line through 40 randomly chosen points.
      You can change the intercept and the slope of the line by using the sliders on the left hand side"),
      
    p("The output is two graphs: The line drawn together with the original points and a histogram of the residuals, calculated by Y - Slope*X - Intercept")
  )
))
