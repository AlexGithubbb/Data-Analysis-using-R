#=========================================
# Task5 Exercise 1 Get a ham/spam SMS file
Needed <- c("tm","SnowballCC","RColorBrewer","ggplot2","wordcloud","biclust","igraph","fpc")
install.packages(Needed, dependencies = T)
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/",type = "source")
setwd("/Users/Alexpower/Desktop/R/task5")
getwd()
library("tm")
library("NLP")
sms <- read.csv("spam_ham.csv",stringsAsFactors = FALSE)
head(sms)
tail(sms)
str(sms)
summary(sms)
#sms$text