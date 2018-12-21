getwd()
setwd("/Users/Alexpower/Desktop/R/task4")
getwd()
install.packages(c("readr","TR","forecast"))
library("forecast")
library("dplyr")
library("TTR")

amzn <- read.csv("AMZN.csv", TRUE, ",")
####################################

#Task4 Exercise 1 first 6 entires
# method 1
head(amzn,6)
# method 2
amznNoDate <- amzn %>% select(-Date)
#amznNoDate
amznNew <- data.frame(Date=amzn$Date, amznNoDate)
#amznNew
amznNewFirst6 <- amznNew[1:6, 1:7]
amznNewFirst6
