install.packages(c("tidyverse","dplyr","ggplot2"))
library(tidyverse)
library(dplyr)
library(ggplot2)
# Exercise 1: Get dataset from github
bad_drivers <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/bad-drivers/bad-drivers.csv")
head(bad_drivers,3)
#list the variable names
colnames(bad_drivers)

#Exercise 2: Since the variable names are too complicated, we change them into brief ones: nums, speeding, alcohol, not_distracted, first_collision and insurance_company_loses
bad_drivers_brief <- bad_drivers %>% select(State, 
                     nums= Number.of.drivers.involved.in.fatal.collisions.per.billion.miles,
                      speeding = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding,
                      alcohol = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired,
                      not_distracted = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted,
                      first_collision = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents,
                      car_insurance = Car.Insurance.Premiums....,
                      insur_comp_loses = Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver.... )
# list the updated variable names
colnames(bad_drivers_brief)
# list the first 9 rows of updated dataset
head(bad_drivers_brief,9)
# Exercise3: Transfer the percentage value into the real numbers of people and create a new dataframe called 'bad_drivers2'
attach(bad_drivers_brief) # replace the $ function
alcohol_num <- round(nums*alcohol*0.01,2)
speeding_num <- round(nums*speeding*0.01,2)
not_distracted_num <- round(nums*not_distracted*0.01,2)
first_collision_num <- round(nums*first_collision*0.01,2)
bad_drivers2 <- data.frame(State, 
                           nums, 
                           speeding_num, 
                           alcohol_num, 
                           not_distracted_num, 
                           first_collision_num, 
                           car_insurance, 
                           insur_comp_loses)

# summary 
summary(bad_drivers2)
# Exercise 4: list the first 9 rows of percentage transfered dataset
head(bad_drivers2,9)

# Exercise 5: list the number of variables and obervations
dim(bad_drivers2)
nrow(bad_drivers2)
ncol(bad_drivers2)

# Exercise 6: Use attach() function to aviod of using '$' and use it to calculate the mean value of car insurance
attach(bad_drivers2)
mean(car_insurance)
# Exercise 7: Sort data with descending collisions per billion miles(nums) in each State
descendingNums <- bad_drivers2[order(nums,decreasing = TRUE),]
head(descendingNums,30)
# Exercise 8: List all the States who exceed the average value of each factor
mean(nums)#15.7902
bad_drivers2 %>% filter(nums > mean(nums), 
                        speeding_num>mean(speeding_num),
                        alcohol_num>mean(alcohol_num),
                        first_collision_num>mean(first_collision_num),
                        car_insurance>mean(car_insurance),
                        insur_comp_loses>mean(insur_comp_loses))                        
# Exercise 9: Select State 'New Jersey'
bad_drivers2 %>% filter(State == "New Jersey") 


#**************************************nums**************************************
# Exercise 10: Plot the histogram of the number of Drivers Involved In Fatal Collisions Per Billion Miles In Each State with a descending trend and 
# show the mean value line 
mean(nums) # 15.7902
ggplot(bad_drivers2, aes(x=State, y=nums, label = nums)) + 
  geom_bar(stat="identity", fill="#C62D42") + geom_text(color="white" ,position = position_stack(vjust = 0.6))+ 
  ylab("Number of drivers") +
  geom_hline(aes(yintercept = mean(nums)), color= "black")+
  labs(title = "Number of Drivers Involved In Fatal Collisions Per Billion Miles In Each State",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  coord_flip() 

# **************************************speeding_num **************************************
# Exercise 11: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Were Speeding In Each State, 
# the total collisions and show the mean value line 
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#FFC800")+ 
  geom_col(aes(x =State, y= speeding_num),fill= "#FA9C44") +
  geom_text(aes(x = State, y= speeding_num, label= speeding_num), color= "black", position = position_stack(vjust = 0.5))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1))+
  geom_hline(aes(yintercept = mean(speeding_num)), color= "black")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Speeding",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()

# **************************************alcohol_num **************************************
# Exercise 12: Plot the histogram of the number of  Drivers Involved In Fatal Collisions While Alcohol Impaired In Each State, 
# the total collisions and show the mean value line 
mean(alcohol_num) # 4.887059
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#63B76C")+ 
  geom_col(aes(x =State, y= alcohol_num),fill= "darkgreen") +
  geom_text(aes(x = State, y= alcohol_num, label= alcohol_num), color= "white", position = position_stack(vjust = 0.5))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 0.9))+ 
  geom_hline(aes(yintercept = mean(alcohol_num)), color= "#FDFF00")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Alcohol Impaired",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()


# **************************************not_distracted_num **************************************
# Exercise 13: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Were Not Distracted In Each State and
# the total collisions and show the mean value line 
mean(not_distracted_num) # 13.57294
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#93CCEA")+ 
  geom_col(aes(x =State, y= not_distracted_num),fill= "navyblue") +
  geom_text(aes(x = State, y= not_distracted_num, label= not_distracted_num), color= "white", position = position_stack(vjust = 0.2))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1.05))+ 
  geom_hline(aes(yintercept = mean(not_distracted_num)), color= "#FF5470")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Not Distracted",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()


# **************************************first_collision_num ************************************** 
# Exercise 14: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Had Not Been Involed In Any Previous Collision In 
# Each State and the total collisions, show the mean value line too
mean(first_collision_num) # 14.00549
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#CC99BA")+ 
  geom_col(aes(x =State, y= first_collision_num),fill= "#6A2963") +
  # label of first_collision_num
  geom_text(aes(x = State, y= first_collision_num, label= first_collision_num), color= "white", position = position_stack(vjust = 0.5))+ 
  # label of total number of drivers
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1.05))+ 
  geom_hline(aes(yintercept = mean(not_distracted_num)), color= "#FDFF00")+
  labs(title = "Drivers Involved In Fatal Collisions Who Had Not Been Involed In Any Previous Collision",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()


# **************************************** car_insurance *********************************** 
# Exercise 15: Plot the histogram of the number of Car Insurance Premiums($) In Each State with a descending trend and show the mean value line
mean(car_insurance) # $886.9576
ggplot(bad_drivers2, aes(State, car_insurance, label= car_insurance))+ 
  geom_bar(stat = "identity", fill= "#C88A65") + 
  labs(title = "Average Combined Insurance Premium",
       subtitle="2011") +
  ylab("Car Insurance Premiums($)")+
  geom_hline(aes(yintercept = mean(car_insurance)), color= "#87FF2A")+
  geom_text(color="white", position = position_stack(vjust = 0.57))+
  coord_flip() + theme_dark()


# **************************************** insur_comp_loses ***********************************
# Exercise 16: Plot the histogram of the Loses Incurred By Insurance Companies($) In Each State with a descending trend and show the mean value line
mean(insur_comp_loses) # $134.4931
ggplot(bad_drivers2, aes(State, insur_comp_loses, label= insur_comp_loses))+ 
  geom_bar(stat = "identity", fill= "#6B3FA0") + 
  labs(title = "Loses Incurred By Insurance Companies($)",
       subtitle="Collosions per insured drivers, 2010") +
  geom_hline(aes(yintercept = mean(insur_comp_loses)), color = "#87FF2A")+
  ylab("Company Companies Loses($)")+
  geom_text(color="white", position = position_stack(vjust = 0.63))+
  coord_flip() + theme_dark()


# ************************************** RESHAPE ************************************** 
# Exercise 17: Reshape the dataframe by using reshape function 
install.packages("reshape")
library(reshape)
colnames(bad_drivers2)
# create new dataframe 'bad_drivers2_new'
bad_drivers2_new <- bad_drivers2%>%select("State", "speeding_num", "alcohol_num", "not_distracted_num", "first_collision_num")
head(bad_drivers2_new,5)
colnames(bad_drivers2_new)
# create a new dataframe called long_reshape
long_reshape <-reshape(bad_drivers2_new,
                       varying = c("speeding_num","alcohol_num", "not_distracted_num", "first_collision_num"),
                       v.names = "value",
                       timevar = "variable",
                       times = c("speeding_num","alcohol_num", "not_distracted_num", "first_collision_num"),
                       direction = "long",
                       new.row.names = 1:1000)
# The information after reshape
long_reshape

# Exercise 18: Plot the histogram based on the variables
ggplot(long_reshape, aes(State, value, fill=variable, label = value)) + 
  geom_bar(stat = "identity") + xlab("US States") + ylab("The number of Drivers")+
  labs(title = "The number of drivers under different condition in each State",
       subtitle="As a share of fatal collisions per billion miles, 2012")+
  coord_flip() + geom_text(aes(label = value), position = position_stack(vjust = 0.5))






# Exercise 19 List the max value of each factor by reshaping the dataframe and show it out
bad_drivers2_max <- data.frame(Max_nums=max(nums),
                               Max_speeding = max(speeding_num),
                               Max_alcohol = max(alcohol_num),
                               Max_not_distracted= max(not_distracted_num),
                               Max_first_collision= max(first_collision_num),
                               Max_car_insurance = max(car_insurance),
                               Max_insur_comp_loses= max(insur_comp_loses))
bad_drivers2_max
short_reshape <-reshape(bad_drivers2_max,
                       varying = c("Max_nums","Max_speeding","Max_alcohol", "Max_not_distracted",
                                   "Max_first_collision","Max_car_insurance","Max_insur_comp_loses"),
                       v.names = "Max_value",
                       timevar = "variable",
                       times = c("Max_nums","Max_speeding", "Max_alcohol", "Max_not_distracted",
                                 "Max_first_collision","Max_car_insurance","Max_insur_comp_loses"),
                       direction = "long",
                       new.row.names = 1:1000)
short_reshape
