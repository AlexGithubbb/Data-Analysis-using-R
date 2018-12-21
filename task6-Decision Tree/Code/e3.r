# Task 6 Exercise3: 
install.packages("rattle")
library(rattle.data) # rattle library is not available on OSX system, here we use rattle.data to grab the weather data
data("weather")
head(weather)
str(weather)
head(weather)
attach(weather)
# Construct a DT to predict if it rains tomorrow based on today's degree of sunshine and the degree of the cloud avalibility at 3pm:
tree_rain_tomorrow <- tree(RainTomorrow~ Sunshine+Cloud3pm, data = weather)
plot(tree_rain_tomorrow)
text(tree_rain_tomorrow, pretty=0)
# Explain the resulted DT: 
# As we can see, the tree spreads by two branches under each case, thsi will consider all the avaliable cases and include them all in one tree,
# but the disadvantages are as the predicted result showing here, there is only "yes" or "no" result, this result is too certain for any prediction, it is not a 
# proper prediction.

# Make it better by using rpart.plot 
fit3 <- rpart(RainTomorrow~ Sunshine+Cloud3pm,data = weather, method = "class")
rpart.plot(fit3)
# Generate another DT by using the 'ctree' from 'party' packages
library(party)
ct <- ctree(RainTomorrow~ Sunshine+Cloud3pm, data = weather)
plot(ct)
# Explain the resulted ctree DT: 
# This ctree plot gives us the percentage of the probability of whether it rains tomorrow or not, which are more practical and valuable for data analysis as 
# a prediciton

