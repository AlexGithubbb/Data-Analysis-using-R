#Exercise 3:  Plot a histogram of the prices distribution for 
#prices up to $2500. Design your histogram to show values for 
#each $500 increment. Can you tell now which bin has the highest value?  
ggplot(diamonds,aes(x=price)) + geom_histogram(binwidth = 50) + 
  ggtitle("Diamond Price Distribution")+ 
  xlab("Price") + ylab("Frequency") + xlim(0,2500)

# From the graph we could tell that most of the diamonds prices are 
#around $500 ~ $1200 and that is also most people prefer to buy 
