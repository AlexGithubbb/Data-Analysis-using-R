install.packages(c("tidyverse","dplyr","ggplot2"))
library(tidyverse)
library(dplyr)
library(ggplot2)
# Exercise 1: Get dataset from github
bad_drivers <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/bad-drivers/bad-drivers.csv")
head(bad_drivers,3)
#list the variable names
colnames(bad_drivers)