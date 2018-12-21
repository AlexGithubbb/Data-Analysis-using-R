#Exercise 1: What you can tell about the price distributions (i.e. frequencies) 
#for the Diamond data frame? Use ggplot2 histogram to show your answer.
#From the histogram what you can tell about the price range most people prefer to buy? 

ggplot(diamonds,aes(x=price)) + geom_histogram(binwidth=500)+ ggtitle("Diamond Price Distribution") + 
  xlab("Diamond Price U$") + ylab("Frequency")

#From the histogram we can tell that people prefer to buy the diamonds with the price < $1000, 
#particularly, the range between $500 ~ $1000

