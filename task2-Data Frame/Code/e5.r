#Task2 Exercise 5 the year that each company made the max profit
MaximumProfitCompaniesData <- ddply(marginRoundedCompaniesData,"company", function(x) x[x$margin == max(x$margin),])
MaximumProfitCompaniesData
