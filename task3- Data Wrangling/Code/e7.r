#Task3 Exercise 7
# method 1 using pipe %>% to combine dataset and the filter function
cars_m_h_s %>% filter(mpg>20, hp>100)
# method 2 usnig dataset nested filter function
filter(cars_m_h_s, mpg>20, hp>100)