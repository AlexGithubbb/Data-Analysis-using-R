#Task3 Exercise 4 
#Change the column names of cars_m_h from ‘miles_per_gallon’, and ‘horse_power’ to ‘mpg’ and ‘hp’ respectively. 
# method 1 rename
cars_m_h <- rename(cars_m_h,mpg = miles_per_gallon,hp = horse_power)
cars_m_h
# method 2 pipe with rename
cars_m_h <- cars_m_h %>% rename(mpg = miles_per_gallon,hp = horse_power)
cars_m_h
