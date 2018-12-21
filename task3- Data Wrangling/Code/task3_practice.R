install.packages(c("tidyverse","gapminder"))
library(gapminder)
View(gapminder)
head(gapminder)
gapminder$lifeExp
head(gapminder$lifeExp)
str(gapminder$lifeExp)
summary(gapminder$lifeExp)
gapminder %>% select(year, lifeExp)
yearAndLifeExp <- select(gapminder,year,lifeExp)
yearAndLifeExp
filter(gapminder, lifeExp < 29)
filter(gapminder, country == "Mexico")
filter(gapminder, country %in% c("Mexico","Peru"))
filter(gapminder, country == "Mexico", year== 2002)
filter(gapminder, country =="Sweden") 
mean(x$lifeExp)
#Using Select and Filter together
# method 1
#gap_cambodia <- filter(gapminder, country == "Cambodia")
#gap_cambodia2 <- select(gap_cambodia, -continent, -lifeExp)
#gap_cambodia
# method 2
gap_cambodia <- gapminder %>% filter(country=="Cambodia")
gap_cambodia2 <- gap_cambodia %>% select(-continent, -lifeExp)
gap_cambodia2
#  OR (by using pipe to chain those two operations together)
gap_cambodia <- gapminder %>% filter(country=="China")%>%select(-continent, -lifeExp)
gap_cambodia

# mutate() function --- add new variables
gapminder %>% mutate(index = 1:nrow(gapminder))
gapminder %>% filter(country %in% c("China", "Peru")) %>%  mutate(gdp = pop*gdpPercap)
gapminder %>% 
  filter(country %in% c("Egypt","Vietnam")) %>% 
  mutate(max_gdpPercap = max(gdpPercap)) 

#groupby()
gapminder %>% 
  group_by(country) %>%
  mutate(gap = pop*gdpPercap,
         max_gdp = max(gap)) %>%
  ungroup() %>%
  tail(30)

# Summarize() will only keep the columns that are grouped_by or summarized
gapminder %>%
  group_by(country) %>%
  mutate(gdp= pop * gdpPercap) %>%
  summarize(max_gdp= max(gdp)) %>%
  ungroup()
  
# arrange() with an descending orders
gapminder %>%
  group_by(country) %>%
  mutate(gdp= pop * gdpPercap) %>%
  summarize(max_gdp= max(gdp)) %>%
  ungroup() %>%
  arrange(-max_gdp)

# Combine Data from different tables
x1 <- c("A","B","C")
x2 <- c("1","2","3") 
a <- data.frame(x1,x2)
a
x1 <- c("A","B","D")
x3 <- c("T","F","T") 
b <- data.frame(x1,x3)
b
# different cases for combining datasets
dplyr::left_join(a,b,by ="x1")
dplyr::right_join(a,b,by ="x1")
dplyr::inner_join(a,b,by ="x1")
dplyr::full_join(a,b,by = "x1")

# tidy the data
library(stringr)
library(dplyr)
library(tidyr)
library(lubridate)

getwd()
setwd("/Users/Alexpower/Desktop/R/task3")
getwd()
dates <- read.csv("dates_for_wrangling.csv", TRUE, ",")
dates <- read.csv(rawfile, header = FALSE, col.names = c("date"))
length(dates$date)
fixdates <- function(date) {
  fixed <- c()
  for (i in 1:length(date)) {
    if(is.na(ymd(date[i]))){
      if(is.na(mdy(date[i]))){
        if(is.na(dmy(date[i]))){
          fixed[i] <- NA
        } else {
          fixed[i] <- dmy(date[i])
        }
      }else {
       fixed[i] <- mdy(date[i])
      }
    }else {
     fixed[i] <- ymd(date[i])
    }
  }
  class(fixed) <- "Date"
  fixed
}
dates$FixedDate <- fixdates(dates$date)
dates


# another method for data wrangling by using mutate()
dates <- read.csv("/Users/Alexpower/Desktop/dates_for_wrangling.csv", TRUE, ",")
dates <- read.csv(rawfile, header = FALSE, col.names = c("date"))
length(dates$date)
fixed <- mutate(dates, yyyymmdd = ymd(date), mmddyyyy = mdy(date), 
                ddmmyyyy = dmy(date)) %>% unite("fixedup", yyyymmdd, ddmmyyyy, mmddyyyy
                                                , sep = "")
fixed$fixedup <- gsub("NA","", fixed$fixedup)
fixed
fixed_md_dm <- fixed %>% mutate(fixedup, month = month(fixedup), day = day(fixedup), to_be_reviewed = day(fixedup) <= 12 & month(fixedup) <= 12)
fixed_md_dm


# use nycflights13 package to learn about relational data
install.packages(c("tidyverse","nycflights13"))
library(tidyverse)
library(nycflights13)
attach(planes)
head(planes,5)
head(airports)
head(weather)
head(airlines)
head(flights)
head(planes$tailnum,10)
head(flights$tailnum)
planes %>%
 count(tailnum) %>%
  filter(n>1)

flights %>%
  count(year, month, day, flight) %>% 
  filter(n>1)
flight2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)
flight2
flight2 %>%
  select(-origin, -dest) %>%
  left_join(airlines, by = "carrier")

#
#What will I learn? 
#  By time you finish this tutorial(https://www.kaggle.com/rtatman/manipulating-data-with-the-tidyverse), 
#  you will be able to take a data frame and:
  
#Use the pipe (%>%) to create a seamless workflow
#Use select() to select one or more columns
#Use filter() to select one or more rows
#Use mutate() to add new variables
#Use arrange() to change the order of rows
#Use summarize() to convert a variable to a single value
#Use group_by() to group sets of observations







