# Exercise 8: List all the States who exceed the average value of each factor
mean(nums)#15.7902
bad_drivers2 %>% filter(nums > mean(nums), 
                        speeding_num>mean(speeding_num),
                        alcohol_num>mean(alcohol_num),
                        first_collision_num>mean(first_collision_num),
                        car_insurance>mean(car_insurance),
                        insur_comp_loses>mean(insur_comp_loses))  