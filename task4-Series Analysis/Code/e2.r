#Task4 Exercise 2 

amzn_ts <- ts(rev(amzn$Close), frequency = 12, start = c(2008,3))
amzn_ts
plot.ts(amzn_ts)