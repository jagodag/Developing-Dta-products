library(shiny)
library(caret)
data(faithful)
lm1 <- lm(eruptions ~ waiting, faithful)

pred <- function(t) coef(lm1)[1] + coef(lm1)[2] * t
shinyServer(
  function(input,output){
    output$t <- renderPrint({input$t})
    output$radio <- renderPrint({input$radio})
    output$selectBox <- renderPrint({input$selectBox})
    output$prediction <- renderPrint({pred(input$t)})
    
    output$predPlot <- renderPlot({
      plot(faithful$waiting, faithful$eruptions, pch=19, col="blue", xlab="Waiting[mins]", ylab= "Duration[mins]")

    lines(c(input$t,input$t),c(0,200),col = input$selectBox,lwd = 5)
    lines(faithful$waiting, predict(lm1), col = input$radio,lwd=3)
    
    
    #mse <- mean((galton$child - mu)^2)
    #text(63,150,paste("mu=",mu))
    #text(63,140,paste("MSE = ",round(mse,2)))
    })
  })