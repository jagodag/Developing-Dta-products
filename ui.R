library(shiny)

shinyUI(pageWithSidebar(
  titlePanel("Predicting waiting time for eruption"),
  sidebarPanel(
    sliderInput('t','Give the waiting time since the last eruption (mins)', 50,min=50,max=90,step = 5,),
   
    radioButtons("radio", label =h4("Choose color of the line that will show prediction: "),
                       choices = list("Blue" = "blue",
                                      "Red" = "red"),
                       selected = "blue"),
    selectInput("selectBox", label =h4("Choose color of the line that will indicate waiting time: "),
                 choices = list("Blue" = "blue",
                                "Red" = "red"),
                 selected = "blue"),
    submitButton('Calculate!')
                       
                       
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Prediction",
      h4('We are going to calculate the predicted duration of the eruption based on waiting time: ',style = "font-family:'times';font-sil6pt"),
      verbatimTextOutput("t"),
      h4('Prediction is equal to:',style = "font-family:'times';font-sil6pt"),
      verbatimTextOutput("prediction"),
      plotOutput('predPlot')
    , img(src = "vulcano.jpg", height = 200, width = 600,align = "center")
      
      
      
      
      ),
      tabPanel("Supporting Documentation",
               h5('This shiny application calculates simple prediciton for duration of eruption based on waiting time since last eruption.',style = "font-family:'times';font-sil6pt"),
                  
               h3('About Application'),  
               p('Sample data is based on ', strong('faithful   ') , '   libarary in the ', strong(' caret ') , ' package. For the purpose of simplifaction, i didnt split data into training and test set but carried out the prediction model on whole data set.',style = "font-family:'times';font-sil6pt"),
               h5('We assume that there is a',strong('linear'),' relation between waiting time and duration. Therefore simple linear regression model is being applied by function lm where eruption is being described by waiting. User choses the waiting time for which prediction will be calculated.',style = "font-family:'times';font-sil6pt"),
               div("The minimum time allowed is 50, the maximum is 70.",style = "color:red"),
               h5('The plot will show you the relation between waiting and duration, in addition the black line will show you the prediction, and as you change the time on the slider and click Submit button, the vertical line will move accordingly so you can easily assess the prediction from the chart.',style = "font-family:'times';font-sil6pt")
             
               
               )
      )
  
    )
  ))