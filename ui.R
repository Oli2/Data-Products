
## ui.R

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Predicting your childs height"),
  
  sidebarPanel(
    numericInput("father", 'Fathers height in inch', 60, min = 50, max = 80, step =.25),
    numericInput('mother', 'Mothers height in inch', 60, min = 50, max = 80, step =.25),
    numericInput('children', 'Number of children in your family', 2, min = 1, max = 10, step =1),
    numericInput('childNum', 'Number of this child within family', 2, min = 1, max = 10, step =1),
    radioButtons("gender", "Your childs gender",
                       c("male" = "male",
                         "female" = "female")),
                      selected = "female",
    submitButton("Submit")
  ),

 #Show the prediciton
   mainPanel(
     tabsetPanel(
     tabPanel("Prediction", verbatimTextOutput("prediction")),
     tabPanel("Plot", plotOutput("family_plot"))
#      h3("Perdicted height of your child"),
#      h3(textOutput("prediction"))
    
      )
))
)

# 
# # Define UI for application that plots random distributions 
# shinyUI(pageWithSidebar(
#   
#   # Application title
#   headerPanel("Hello Shiny!"),
#   
#   # Sidebar with a slider input for number of observations
#   sidebarPanel(
#     numericInput('father', 'Numeric input, labeled father', 60, min = 50, max = 80, step = .25),  
#       selectInput(inputId = "father",
#                     numericInput('father', 'Glucose mg/dl', 64, min = 60, max = 80, step = .25),
#                     label = "Father's height in inch",
#                     choices = c(5.5, 6, 6.5)
#   ),
#   
#   # Show a plot of the generated distribution
#   mainPanel(
#     h3("distPlot")
#   )
# ))
# )
