getwd()
setwd("/Users/Alexpower/Desktop/R/task4")
getwd()
install.packages("TTR")
install.packages("forecast")
install.packages("readr")
library("readr")
library("forecast")
library("dplyr")
library("TTR")

amzn <- read.csv("AMZN.csv", TRUE, ",")
####################################

#Task4 Exercise 1 first 6 entires
# method 1
head(amzn,6)
####################################

#Task4 Exercise 2 

amzn_ts <- ts(rev(amzn$Close), frequency = 12, start = c(2008,3))
amzn_ts
plot.ts(amzn_ts)
####################################

#Task4 Exercise 3 
amzn_closing_log <- log(amzn_ts)
plot(amzn_closing_log)
####################################

#Task4 Exercise 4 
amznCompse <- decompose(amzn_ts)
plot(amznCompse)
####################################

#Task4 Exercise 5 
amznF <- HoltWinters(amzn_ts, gamma = F)
amznF;
plot(amznF)

# for the further prediction
amznFC <- forecast(amznF, h=20)
plot(amznFC)

