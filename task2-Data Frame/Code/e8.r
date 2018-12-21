#Task2 Exercise 8 reshape
long_reshape <-reshape(marginRoundedCompaniesData,
                       varying = c("revenue","profit","margin"),
                       v.names = "variable",
                       timevar = "value",
                       times = c("revenue","profit","margin"),
                       direction = "long",
                       new.row.names = 1:1000)
long_reshape