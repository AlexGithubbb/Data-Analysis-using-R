#Task2 Exercise 3
#margin<- round(companiesData$margin)
#method 1
marginRounded<- round(margin,1)
#marginRounded
marginRoundedCompaniesData <- data.frame(fy,company,revenue,profit,margin = marginRounded)
marginRoundedCompaniesData
#method 2
companiesData3 <- cbind(companiesData, margin=marginRounded)
companiesData3