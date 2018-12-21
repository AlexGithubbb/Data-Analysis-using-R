#Task3 Exercise 8
# method 1 using pipe %>% to combine dataset and the filter function
mtcars %>% filter(rownames(mtcars) == "Lotus Europa")
# method 2 usnig dataset nested filter function
filter(mtcars, rownames(mtcars) == "Lotus Europa")