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