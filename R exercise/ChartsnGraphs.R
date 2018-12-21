AData <- read.csv("brUsers.csv", TRUE, ",")
hist(AData$age, main="Ages of the Users of AlexData", ylab="Users", xlab="Ages")

#plot(AData$age, AData$income, ylab="Age",xlab = "Income")
head(AData)
