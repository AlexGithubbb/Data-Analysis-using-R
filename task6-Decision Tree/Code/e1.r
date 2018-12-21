getwd()
setwd("/Users/Alexpower/Desktop/R/task6/")
getwd()

# Task6 Exercise1: You are required to create a data frame for the data in Table 1. In table 1 the rows denote specific days, attributes denote 
# weather conditionws on the given day, and the class denotes whether the conditions are conductive to playing golf.
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
golf_play <- data.frame(outlook, humidity, windy, play)
attach(golf_play)
golf_play
range(humidity)
dim(golf_play)

#humid = ifelse(humidity > 68, "yes","no")
#golf_play_humid = data.frame(golf_play, humid)
#dim(golf_play_humid)
#names(golf_play_humid)
# get the humidity away, no use it any more
#golf_play_humid = golf_play_humid[,-2]
#names(golf_play_humid)
