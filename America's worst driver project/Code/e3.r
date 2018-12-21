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