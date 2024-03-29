---
title       : Developing Data Products - Coursera Project
subtitle    : Predicting Eruption Duration based on waiting time
author      : JG
job         : Data Analyst
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
revealjs    : {theme: beige,transition: cube}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn     # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Developing Data Products as part of Coursera Assignment



---

## Introduction and Purpose of the Project

This project is a part of Coursera's course 'Developing Data Products'. 

The purpose of this project is to write a shiny application that would carry out a simple prediction algorithm, and support it with the Slidify or Rstudio Presenter presentation (obviously Slidify was chosen here to pitch the application) - not to pitch it technically but to promote the tool, say how cool it is and why you should be using it.


Shiny application enables user to embed R code into HTML5 (web) and it's unbelievably easily achievable!!! It allows other users to access web in the form of friendly interface. 

The URL to access to my Shiny application is here: https://dzagangel.shinyapps.io/ShinyApp


--- .class #id 

## Shiny Application
 
The really cool thing is that you can make your application as interactive as you want! You set dynamic variables that user is able to input/change and as a result calculations and output change accordingly.


You don't even need to know html5, css or js to create a user friendly application!
You create two R scripts, save them as ui.R and server.R in one folder, input command runApp() and it's done! 

The simplicity is the key here!

--- .class #id 

## Shiny Supporting Documentation

Shiny application calculates simple prediciton for duration of eruption based on waiting time since last eruption.       

Sample data is based on 'faithful' libarary in the 'caret' package. 

To simplify, linear prediction model is based on whole data set.


The plot will show you the relation between waiting and duration, in addition the black line will show you the prediction, and as you change the time on the slider and click Submit button, the vertical line will move accordingly so you can easily assess the prediction from the chart.

--- .class #id 

## R code used in the Application



  
  ```r
  lm1 <- lm(eruptions ~ waiting, faithful); 
  ```
   
   ```r
   plot(faithful$waiting, faithful$eruptions, pch=19, col="blue",xlab="Waiting [mins]",
   ylab= "Duration");  lines(c(60,60),c(0,200),col = "red",lwd = 5);
   lines(faithful$waiting, predict(lm1), col = "blue",lwd=3)
   ```
   
   <img src="assets/fig/simple-plot-1.png" title="plot of chunk simple-plot" alt="plot of chunk simple-plot" style="display: block; margin: auto;" />
 Thank you for your attention and I hope you enjoyed the eruption of hot information!! :)




