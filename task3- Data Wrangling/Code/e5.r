#Task3 Exercise 5 
# method 1 slice
cars_m_h_s <- cars_m_h[10:35,1:2]
cars_m_h_s
# method 2 pipe with slice
cars_m_h_s <- cars_m_h %>% slice(10:35)
cars_m_h_s