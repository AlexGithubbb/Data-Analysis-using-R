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