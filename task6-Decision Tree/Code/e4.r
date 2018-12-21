# Task 6 Exercise4: In this exercise you will use also the weather data and the ctree but you will build a decision tree for predicting if it will rain 
#tomorrow (or not) based on the following attributes: 
ct2 <- ctree(RainTomorrow~ Sunshine+ Pressure9am+Cloud9am, data = weather)
plot(ct2)
