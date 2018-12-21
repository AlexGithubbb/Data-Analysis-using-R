#Task2 Exercise 10  Draw another observation on the company’s data either by performing more transformations on the data frame or using graphs to show the observation. 
# remove the rows from the data frame
rows_to_keep <- c(FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE)
limitedCompaniesData <- companiesData[rows_to_keep,]
limitedCompaniesData
# highest revenue for each company in which year
marginRoundedCompaniesData
highestRevenueMarginData <- ddply(marginRoundedCompaniesData, "company", function(x) x[x$revenue == max(x$revenue),])
highestRevenueMarginData
