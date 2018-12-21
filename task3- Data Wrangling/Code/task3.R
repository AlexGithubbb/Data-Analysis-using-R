mtcars <- read.csv("mtcars.csv",TRUE,",")
library(dplyr)
data(mtcars)
mtcars %>% select(hp)

#nrow(mtcars)
#ncol(mtcars)
#select(mtcars, mpg, wt, new_cyl = cyl)
#head(mtcars)
####################################

#Task3 Exercise 1
mtcars %>% select(-hp)
# arrange data by descending or aescending orders
mtcars %>%
  arrange(carb)
####################################

#Task3 Exercise 2
mtcars %>% select(mpg,hp,vs:gear)

####################################

#Task3 Exercise 3
# method 1 select
cars_m_h <- select(mtcars, miles_per_gallon = mpg,horse_power= hp )
cars_m_h
# method 2: pipe with select
cars_m_h <- mtcars %>% select(miles_per_gallon = mpg,horse_power= hp ) 
cars_m_h

####################################

#Task3 Exercise 4 
#Change the column names of cars_m_h from ‘miles_per_gallon’, and ‘horse_power’ to ‘mpg’ and ‘hp’ respectively. 
# method 1 rename
cars_m_h <- rename(cars_m_h,mpg = miles_per_gallon,hp = horse_power)
cars_m_h
# method 2 pipe with rename
cars_m_h <- cars_m_h %>% rename(mpg = miles_per_gallon,hp = horse_power)
cars_m_h

####################################

#Task3 Exercise 5 
# method 1 
cars_m_h_s <- cars_m_h[10:35,1:2]
cars_m_h_s
# method 2 pipe with slice
cars_m_h_s <- cars_m_h %>% slice(10:35)
cars_m_h_s

####################################

#Task3 Exercise 6
cars_m_h %>% sample_frac(size = 0.5, replace = FALSE)

####################################

#Task3 Exercise 7
# method 1 using pipe %>% to combine dataset and the filter function
cars_m_h_s %>% filter(mpg>20, hp>100)
# method 2 usnig dataset nested filter function
filter(cars_m_h_s, mpg>20, hp>100)

####################################

#Task3 Exercise 8
# method 1 using pipe %>% to combine dataset and the filter function
mtcars %>% filter(rownames(mtcars) == "Lotus Europa")
# method 2 usnig dataset nested filter function
filter(mtcars, rownames(mtcars) == "Lotus Europa")

####################################

#Task3 Exercise 9
getwd()
setwd("/Users/Alexpower/Desktop/R/task3")
money <- read.delim("salesData.txt")
class(money)
Pound <- money %>% slice(1:100)
Pound <- Pound %>% select(Pound = sales)
Pound <- Pound[order(Pound),]
Pound
USD <- money %>% slice(101:200)
USD <- USD %>% select( USD = sales)
USD <- USD[order(USD),]
USD
df <- data.frame(Pound,USD)
df

