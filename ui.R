#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Predictors"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("weight",
                  "Weights in 1000lb:",
                  min = 1,
                  max = 6,
                  value = 5),
      sliderInput("hp",
                  "Gross horsepower:",
                  min=50,
                  max=350,
                  value=100),
      selectInput("type", "Car type:", choices=c("Automatic","Manual")),
      selectInput("cylinder", "Number of cylinders:", choices=c("4","6","8")),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
))