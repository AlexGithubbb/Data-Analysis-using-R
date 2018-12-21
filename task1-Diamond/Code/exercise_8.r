#Exercise 8: Using the scatter graph of price vs carat, 
  #plot a smooth curve that can fits the trend of the data.

#point with trend curve
ggplot(diamonds, aes(x= carat,y= price))+
  geom_point()+ ggtitle("Diamond Price vs Carat")+ 
  xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)
#only showing the trend curve
ggplot(diamonds, aes(x= carat,y=price))+ 
  ggtitle("Diamond Price vs Carat")+ xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)

# log one: it’s easier to see the precise relationship 
#between carat and price if we log transform them:
ggplot(diamonds, aes(x= log10(carat),y= log10(price))) +
  geom_point()+ ggtitle("Diamond Price vs Carat")+ 
  xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)
#only the curve
ggplot(diamonds, aes(x= log10(carat),y= log10(price))) + stat_smooth(se=FALSE)
