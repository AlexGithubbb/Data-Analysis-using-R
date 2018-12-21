#Task6 Exercise2: You are required to construct a decision tree using the tree package of the play golf dataset described in Table 1. 
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
# Generating the Desicion Tree(DT) by using 'subset' function
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
# Let's translate the probability output to categorical output
maxidx <- function(arr){
  return(which(arr == max(arr)))
}
idx <- apply(predictions, c(1), maxidx)
prediction2 <- c("outlook","humidity")[idx]
# Table the predictions
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
# Generating the DT by using 'rpart'
install.packages("rpart.plot")
install.packages("rpart")
install.packages("RColorBrewer")
library(rpart)
library(rpart.plot)
library(RColorBrewer)
fit1 <- rpart(play~.,data = golf_play, method = "class")
fit2 <- rpart(play~windy,data = golf_play, method = "class")
rpart.plot(fit1)
rpart.plot(fit2)
prediction <- predict(fit1, test.set, type = "class")
table(prediction)
