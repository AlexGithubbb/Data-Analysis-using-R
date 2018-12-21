#Exercise 9: Using the scatter graph of price vs carat with respect to the diamond color 
  #and find a smooth line that fits such scattered data. 


ggplot(diamonds, aes(x= diamonds$carat,y= diamonds$price))+
  geom_point(aes(color=factor(diamonds$color))) + 
  ggtitle("Diamond Price vs Carat due to the colors")+ 
  xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)


