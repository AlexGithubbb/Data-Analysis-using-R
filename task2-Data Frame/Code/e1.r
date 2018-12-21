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
