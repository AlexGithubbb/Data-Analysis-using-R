#Task2 Exercise 4 cal bestmargin and add it into data frame 
library(plyr)
library(reshape2)
bestMarginCompaniesData <- ddply(marginRoundedCompaniesData,"company", summarize, bestMargin= max(margin))
bestMargin
#add the bestMargin into the newBestMarginCompaniesData data frame
# method 1
newBestMarginCompaniesData <- ddply(marginRoundedCompaniesData,"company", transform, bestMargin= max(margin))
newBestMarginCompaniesData
# method 2
newBestMarginCompanies <- merge(marginRoundedCompaniesData, bestMargin, all.x = FALSE)
newBestMarginCompanies
