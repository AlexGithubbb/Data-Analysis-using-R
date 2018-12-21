mtcars <- read.csv("mtcars.csv",TRUE,",")
library(dplyr)
#Task3 Exercise 1
data(mtcars)
mtcars %>% select(-hp)
