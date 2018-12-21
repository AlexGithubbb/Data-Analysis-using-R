#Exercise 7: Use Scatter graph to show the distribution 
  #of prices vs carat according to the cut type of the diamond.

#method 1:
qplot(diamonds$carat, diamonds$price,shape = diamonds$cut)+ xlab("Carat") + ylab("Price")+
  ggtitle("Diamonds Price vs Carat with the Cut")+ xlim(2,2.5)
#method 2:
ggplot(diamonds, aes(x=carat,y=price)) + geom_point(aes(shape=factor(cut)))+ 
  xlab("Carat") + ylab("Price U$")+ ggtitle("Diamonds Price vs Carat with the Cut")+
xlim(2,2.5)
