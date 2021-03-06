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