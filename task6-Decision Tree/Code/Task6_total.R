getwd()
setwd("/Users/Alexpower/Desktop/R/task6/")
getwd()
# Task6 Exercise1: 
outlook <- c("rain","overcast","rain","sunny","rain","rain","sunny","overcast",
             "overvast","overcast","sunny","sunny","rain","rain","overcast","sunny",
             "overcast","overcast","sunny","sunny","sunny","overcast")
outlook <- as.factor(outlook)
outlook
humidity <- c("79","74","80","60","65","79","60","74","77","80","71","70","80","65","70","56","80","70","56","70","71","77")
humidity<- as.numeric(as.character(humidity))
humidity
windy <- c("TRUE","TRUE","FALSE","TRUE","FALSE","TRUE","TRUE","TRUE","TRUE","FALSE"
           ,"TRUE","FALSE","FALSE","FALSE","TRUE","TRUE","FALSE","TRUE","TRUE","FALSE","TRUE","TRUE")

windy <- as.factor(windy)
windy

play <- c("FALSE","FALSE","TRUE","FALSE","TRUE","FALSE","FALSE","TRUE","TRUE","TRUE","FALSE",
          "FALSE","TRUE","TRUE","TRUE","TRUE","TRUE","TRUE","FALSE","TRUE","FALSE","TRUE")
play <- as.factor(play)
play
#humidity
attach(golf_play)
golf_play <- data.frame(outlook, humidity, windy, play)
attach(golf_play)
head(golf_play)
range(humidity)
dim(golf_play)

#humid = ifelse(humidity > 68, "yes","no")
#golf_play_humid = data.frame(golf_play, humid)
#dim(golf_play_humid)
#names(golf_play_humid)
# get the humidity away, no use it any more
#golf_play_humid = golf_play_humid[,-2]
#names(golf_play_humid)


# Task6 Exercise2:

# meaure the information gain (IG)
install.packages("FSelector")
install.packages("RWeka")
install.packages("party")
install.packages("partykit")
library(FSelector)
library(RWeka)
library(partykit)
library(party)
information.gain(play~., data = golf_play)
subset1.golf <- subset(golf_play, humidity > 68)
information.gain(play~., data = subset1.golf)
subset2.golf <- subset(subset1.golf, outlook != "sunny")
information.gain(play~., data = subset2.golf)
subset3.golf <- subset(subset2.golf, windy = TRUE)
information.gain(play~., data = subset3.golf)
m1 <- J48(play~.,data = golf_play)
if(require("party",quietly = TRUE))
  plot(m1)
#######################################################################################
# Measure the accuracy of DT
golf_play <- data.frame(outlook, humidity, windy, play)
library(tree)
set.seed(101)
alpha <- 0.7
inTrain <- sample(1:ncol(golf_play), alpha*ncol(golf_play))
train.set <- golf_play[inTrain,]
test.set <- golf_play[-inTrain,]                  
tree.model <- tree(play ~ humidity + outlook, data = train.set)
tree.model2 <- tree(play ~ humidity + outlook, data = test.set)
#tree.model2 <- tree(play ~ outlook + humidity, data = test.set)
tree.model
tree.model2
plot(tree.model)
text(tree.model)
plot(tree.model2)
text(tree.model2, pretty = 0)
predictions <-predict(tree.model,test.set)  # give the probability to each class
head(predictions)
# point the predictions
# Let's translate the probability output to categorical output
maxidx <- function(arr){
  return(which(arr == max(arr)))
}
idx <- apply(predictions, c(1), maxidx)
prediction2 <- c("outlook","humidity")[idx]
# table the predictions
table(prediction2)
summary(tree.model)
summary(tree.model2)
pruned.tree <- prune.tree(tree.model2, best = 3) 
plot(pruned.tree)
text(pruned.tree)
pruned.prediction <- predict(pruned.tree, test.set, type = "class")
pruned.prediction     
table(pruned.prediction, test.set$outlook)

#######################################################################################

install.packages("rpart.plot")
install.packages("rpart")
install.packages("RColorBrewer")
library(rpart.plot)
library(rpart)
library(RColorBrewer)
#fit <- rpart(play~.,data = golf_play_humid, method = "class")
fit1 <- rpart(play~.,data = golf_play, method = "class")
fit2 <- rpart(play~windy,data = golf_play, method = "class")
rpart.plot(fit1)
rpart.plot(fit2)
prediction <- predict(fit1, test.set, type = "class")

#######################################################################################
# Task 6 Exercise3: 
install.packages("rattle")
library(rattle.data)
data("weather")
head(weather)
str(weather)
head(weather)
attach(weather)
tree_rain_tomorrow_ <- tree(RainTomorrow~ Sunshine+Cloud3pm, data = weather)
plot(tree_rain_tomorrow)
text(tree_rain_tomorrow, pretty=0)
#rpart.plot(tree_rain_tomorrow)
library(party)
ct <- ctree(RainTomorrow~ Sunshine+Cloud3pm, data = weather)
plot(ct)

#######################################################################################
# Task 6 Exercise4: 
ct2 <- ctree(RainTomorrow~ Sunshine+ Pressure9am+Cloud9am, data = weather)
plot(ct2)
#######################################################################################

# Task 6 Exercise5:

head(weather)
library(tree)
set.seed(101)
alpha <- 0.7
inTrain <- sample(1:ncol(weather), alpha*ncol(weather))
train.set <- weather[inTrain,]
test.set <- weather[-inTrain,]                  
tree.model3 <- tree(RainTomorrow ~ Sunshine+Cloud9am+Pressure9am, data = train.set)
tree.model4 <- tree(RainTomorrow ~ Sunshine+Cloud9am+Pressure9am, data = test.set)
tree.model3
tree.model4
plot(tree.model)
text(tree.model, pretty = 0)
plot(tree.model4)
text(tree.model4, pretty = 0)
predictions3 <-predict(tree.model3,test.set)  # give the probability to each class
head(predictions)
# point the predictions
# Let's translate the probability output to categorical output
maxidx <- function(arr){
  return(which(arr == max(arr)))
}
idx <- apply(predictions3, c(1), maxidx)
prediction4 <- c("Sunshine","pressure9am","Cloud9am")[idx]
# table the predictions
table(prediction4)
summary(tree.model3)
summary(tree.model4)
pruned.tree <- prune.tree(tree.model4, best = 12)
plot(pruned.tree)
text(pruned.tree)
pruned.prediction2 <- predict(pruned.tree, test.set, type = "class")
pruned.prediction2     
table(pruned.prediction2)

