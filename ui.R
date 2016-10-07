
## ui.R

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Predicting your childs height"),
  sidebarPanel(
    numericInput("father", "Father's height in inch", 60, min = 50, max = 80, step =.25),
    numericInput('mother', "Mother's height in inch", 60, min = 50, max = 80, step =.25),
    numericInput('children', "Number of children in your family", 2, min = 1, max = 10, step =1),
    numericInput('childNum', "Number of this child within family", 2, min = 1, max = 10, step =1),
    radioButtons("gender", "Your child's gender",
                       c("male" = "male",
                         "female" = "female")),
                      selected = "female",
    submitButton("Submit")
  ),

 #Show the prediciton
   mainPanel(
     tabsetPanel(
     tabPanel("Prediction", verbatimTextOutput("prediction")),
     tabPanel("Plot", plotOutput("family_plot")),
#      h3("Perdicted height of your child"),
#      h3(textOutput("prediction"))
    tabPanel("HowItWorks", 
             p(h5("This application predicts the height of a child based on following input values:")),
#            helpText("The calculation is based on the folllowing input data:"),
             HTML("Father's Height <br>
                   Mother's Height <br>
                   Number of children in your family <br>
                   Number of this child within family <br>
                   Your child's gender <br>
             <br> <br>
            The application uses the predictive model, designed and based on GaltonFamilies data set and has been modeled using Random Forest Machine Learning algorithm
                      ")
    
      )
  ))
 )
)
