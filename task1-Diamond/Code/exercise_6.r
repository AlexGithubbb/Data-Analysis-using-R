#Exercise 6: 
#Use Scatter graph to show the distribution of 
#prices vs carat according to the color type of the diamond.

#method_A:
qplot(diamonds$carat, diamonds$price,color = diamonds$color)+ xlab("Carat") + 
  ylab("Price")+ ggtitle("Diamonds Price vs Carat with colors")

#method_B:
ggplot(diamonds, aes(x=diamonds$carat, y= diamonds$price)) + 
  geom_point(aes(color= factor(color))) + xlab("Carat") +
  ylab("Price") + ggtitle("Diamonds Price vs Carat with colors")
