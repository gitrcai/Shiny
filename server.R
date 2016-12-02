#
# This is the server logic of a Shiny web application. You can run the 
# application bypoiuserweq clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(scatterplot3d)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    dat <- data(mtcars)
    mtcars$am   <- factor(mtcars$am,labels=c("Automatic","Manual"))
    mtcars$cyl  <- factor(mtcars$cyl)
    fit <- lm(mpg~am+cyl+hp+wt, data=mtcars)
    a <- ifelse(input$type=="Automatic", 0, 1)
    b <- ifelse(input$cylinder==6, 1, 0)
    c <- ifelse(input$cylinder==8, 1, 0)
    p=fit$coefficients[1]+a*fit$coefficients[2]+b*fit$coefficients[3]+c*fit$coefficients[4]
    +input$hp*fit$coefficients[5]+input$weight*fit$coefficients[6]
    x <- as.numeric(input$weight)
    y <- as.numeric(input$hp)
    z <- as.numeric(p)
    g1 <- scatterplot3d(mtcars$wt,mtcars$hp,mtcars$mpg, main="MPG Prediction (Blue point) Due to Change of Predictors", pch=16, color="red", xlab="weight in 1000lb", ylab="horse power", zlab="miles per gallon")
    g1$points3d(x, y, z, pch=16, col="blue", cex=3)
  })
})