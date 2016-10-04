library(shiny)
library(caret)
library(ranger)
library(reshape2)

shinyServer(
  function(input, output) {
    output$prediction <- renderText ({
    ModFit_RF <- readRDS("./ModFit_RF.rds")
    input_data <- data.frame("father" =0, "mother"=0,"midparentHeight"=0, "children"=0,"childNum"=0,"gender"="gender")
    midparentHeight <- (input$father + input$mother*1.08)/2
    input_data <- data.frame("father" =input$father,
                             "mother"=input$mother,
                             "midparentHeight"=midparentHeight,
                             "children"=input$children,
                             "childNum"=input$childNum,
                             "gender"=input$gender)
    
    prediction <<- predict(ModFit_RF, newdata = input_data)
    print(prediction)
    
    })
    
    output$family_plot <- renderPlot({
      
      plot_input<- data.frame("father" =input$father,
                              "mother"=input$mother,
                              "child"= prediction)
      plot_input <- melt(plot_input)
      g<- ggplot(plot_input, aes(x=variable, y= value, col=variable, fill=variable))
      g+ geom_bar(stat="identity", width = .2) +
         xlab("Family member") +
         ylab("Height in inch")
    })

   
 })






  
 
