install.packages("ggplot2")
library(ggplot2)
data(iris)
names(iris)
table(iris$Species)
colnames(iris)
ggplot(iris, aes(Petal.Width, Sepal.Width)) + geom_point(aes(color= Species),size = I(4))

# using tree library
install.packages("tree")
library(tree)       
tree1 <- tree(Species~Petal.Width + Sepal.Width, data = iris)
summary(tree1)
plot(tree1)
text(tree1)
plot(iris$Petal.Width, iris$Sepal.Width, pch=19, color= as.numeric(iris$Species))
# partition.tree function to seperate
partition.tree(tree1, label = "Species", add = TRUE)
legend(1.75, 4.5, legend = unique(iris$Species), col = unique(as.numeric(iris$Species)), pch = 19)
     
tree2 <- tree(Species~Sepal.Width + Sepal.Length+ Petal.Length +Petal.Width, data = iris )
summary(tree2)
plot(tree2)
text(tree2)
# the species when the Petal Width < 2.45
iris[iris$Petal.Length < 2.45,5]
length(iris[iris$Petal.Length < 2.45,5])
# Petal Length > 2.45 and the Petal Width > 1.75
hhaha <- iris[iris$Petal.Length >2.45 & iris$Petal.Width > 1.75,5]
length(hhaha)
boxplot(formula= Petal.Length ~ Species, data = iris, xlab= "Species", ylab = "Petal Length")


# Measure the accuracy of DT
library(tree)
set.seed(101)
alpha <- 0.7
inTrain <- sample(1:nrow(iris), alpha*nrow(iris))
train.set <- iris[inTrain,]
test.set <- iris[-inTrain,]                  
tree.model <- tree(Species ~ Sepal.Width + Petal.Width, data = train.set)
tree.model
predictions <- predict(tree.model, test.set) # give the probability to each class
head(predictions)

tree.model <- tree(Species ~ Sepal.Width + Petal.Width, data = train.set)
tree.model2 <- tree(Species ~ Sepal.Width + Petal.Width, data = test.set)
tree.model
tree.model2
plot(tree.model)
text(tree.model)
plot(tree.model2)
text(tree.model2)
predictions <-predict(tree.model,test.set)  # give the probability to each class
head(predictions)
# point the predictions
# Let's translate the probability output to categorical output
maxidx <- function(arr){
  return(which(arr == max(arr)))
}
idx <- apply(predictions, c(1), maxidx)
prediction2 <- c("setosa","versicolor","virginica")[idx]
# table the predictions
table(prediction2, test.set$Species)
summary(tree.model)
summary(tree.model2)
pruned.tree <- prune.tree(tree.model, best = 4)
plot(pruned.tree)
text(pruned.tree)
pruned.prediction <- predict(pruned.tree, test.set, type = "class")
pruned.prediction     
table(pruned.prediction, test.set$Species)

#install.packages("RGtk2",dependencies=TRUE)
#install.packages("rattle",dependencies=TRUE)
install.packages("rpart.plot")
install.packages("rpart")
install.packages("RColorBrewer")
library(rpart.plot)
library(RColorBrewer)
library(rpart)
rpart1 <- rpart(Species ~.,data = iris, method = "class")
# Plot fancy decision tree(DT)
rpart.plot(rpart1,main = "Iris")

# meaure the information gain (IG)
install.packages("FSelector")
install.packages("RWeka")
install.packages("partykit")
library(FSelector)
library(RWeka)
library(partykit)
subset1.iris <- subset(iris, Petal.Width > 0.7)
information.gain(Species~., data = iris)
attach(iris)
Petal.Width > 0.6
subset1.iris <- subset(iris, Petal.Width > 0.6)
information.gain(Species~., data = subset1.iris)
Petal.Width <= 1.7
subset2.iris <- subset(iris, Petal.Width <= 1.7)
information.gain(Species~., data = subset2.iris)
m1 <- J48(Species~., data = iris)
if(require("party",quietly = TRUE))
  plot(m1)



install.packages("rpart.plot")
install.packages("rpart")
install.packages("RColorBrewer")
library(rpart.plot)
library(RColorBrewer)
library(rpart)
rpart1 <- rpart(Species ~.,data = iris, method = "class")
# Plot fancy decision tree(DT)
rpart.plot(rpart1,main = "Iris")




# Practice of Carseats dataset
install.packages("ISLR")
library(ISLR)
data(Carseats)
head(Carseats)
attach(Carseats)
range(Sales)
High = ifelse(Sales >= 8, "yes","no")
Carseats = data.frame(Carseats, High)
names(Carseats)
Carseats = Carseats[,-1]
names(Carseats)
set.seed(2)
train = sample(1:nrow(Carseats), nrow(Carseats)/2)
test = -train
training_data = Carseats[train,]
testing_data = Carseats[test,]
testing_high = High[test]

tree_model = tree(High~.,training_data)
plot(tree_model)
text(tree_model, pretty = 0)






