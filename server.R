library(shiny)
library(UsingR)
x <- rnorm(40,0,1)
y <- x + rnorm(40,0,1)

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      par(mfrow=c(1,2))
      plot(y ~ x, xlab='x', ylab='y', 
           col='blue',main='This is a plot of noisy data\nplus a line through it',
           xlim=c(-2,2),ylim = c(-4,4))
      lines(c(-2,2),c(0,0))
      lines(c(0,0),c(-4,4))
      a <- input$a
      b <- input$b
      lines(x,a*x+b,col="red",lwd=5)
      text(-1, 2, paste("Intercept = ", b))
      text(-1, 1.5, paste("Slope = ", a))
      text(1,-2,paste("MSE = ",round(mean((y-(a*x+b))^2)),2))
      hist(y-a*x-b,main="Residual",xlab="Y - Slope*x - Intercept")
      })
  }
)
