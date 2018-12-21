#Task2 Exercise 7 order with descending
#method 1 
marginRoundedCompaniesData[order(marginRoundedCompaniesData$margin,decreasing = TRUE),]
#method 2
marginRoundedCompaniesData[order(-marginRoundedCompaniesData$margin),]