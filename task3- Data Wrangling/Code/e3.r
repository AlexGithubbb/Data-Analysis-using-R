#Task3 Exercise 3
# method 1 select
cars_m_h <- select(mtcars, miles_per_gallon = mpg,horse_power= hp )
cars_m_h
# method 2: pipe with select
cars_m_h <- mtcars %>% select(miles_per_gallon = mpg,horse_power= hp ) 
cars_m_h
