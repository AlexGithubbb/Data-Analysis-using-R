library(tidyr)
library(ggplot2)

#Task2 Exercise 1
fy<- c(2010,2011,2012,2010,2011,2012,2010,2011,2012)
company<- c("Apple","Apple","Apple","Google","Google","Google","Microsoft","Microsoft","Microsoft")
revenue<- c(65225,108249,156508,29321,37905,50175,62484,69943,73723)
profit<- c(14013,25922,41733,8505,9737,10737,18760,23150,16978)
companiesData<- data.frame(fy,company,revenue,profit)
#head(companiesData)
#names(companiesData)
#rownames(companiesData)
#colnames(companiesData)
#nrow(companiesData)
#rownames(companiesData) = c("ID1","ID2","ID3","ID4","ID5","ID6","ID7","ID8","ID9")
#head(companiesData)
companiesData
# extract the rows and columns
df <- companiesData[c("3","5"),c("fy","profit")] 
df

# initializing the data frame
#fy <- numeric()
#company <- character()
#revenue <- numeric()
#profit <- numeric()
#df <- data.frame(fy, company,revenue, profit)
#df
#Task2 Exercise 2
margin<-c(profit/revenue*100)
#margin
companiesData1 <- data.frame(companiesData,margin)
companiesData1 <- cbind(companiesData,margin)
companiesData1


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


#Task2 Exercise 4 cal bestmargin and add it into data frame 
library(plyr)
library(reshape2)
bestMarginCompaniesData <- ddply(marginRoundedCompaniesData,"company", summarize, bestMargin= max(margin))
bestMarginCompaniesData
newBestMarginCompaniesData <- ddply(marginRoundedCompaniesData,"company", transform, bestMargin= max(margin))
newBestMarginCompaniesData


#Task2 Exercise 5 the year that each company made the max profit
MaximumProfitCompaniesData <- ddply(marginRoundedCompaniesData,"company", function(x) x[x$margin == max(x$margin),])
MaximumProfitCompaniesData


#Task2 Exercise 6 order with ascending
#method 1 
ascendingMarginData <- marginRoundedCompaniesData
ascendingMarginData[order(marginRoundedCompaniesData$margin,decreasing = FALSE),]
#method 2
ascendingMarginData[order(ascendingMarginData$margin),]


#Task2 Exercise 7 order with descending
#method 1 
descendingMarginData <- marginRoundedCompaniesData
descendingMarginData[order(marginRoundedCompaniesData$margin,decreasing = TRUE),]
#method 2
descendingMarginData[order(-marginRoundedCompaniesData$margin),]


#Task2 Exercise 8 reshape
long_reshape <-reshape(marginRoundedCompaniesData,
                       varying = c("revenue","profit","margin"),
                       v.names = "value",
                       timevar = "variable",
                       times = c("revenue","profit","margin"),
                       direction = "long",
                       new.row.names = 1:1000)
long_reshape


#Task2 Exercise 9 ggplot2 (revenue vs profit according to companiy types)
ggplot(companiesData,aes(x=profit,y=revenue,color=factor(company))) + geom_point() + 
  xlab("Profit") + ylab("Revenue") + stat_smooth(method = "loess")
#Task2 Exercise 10 
rows_to_keep <- c(FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE)
limitedCompaniesData <- companiesData[rows_to_keep,]
limitedCompaniesData
