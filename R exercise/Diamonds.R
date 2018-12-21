install.packages("ggplot2")
library(ggplot2)
#library(maps)
#detach("package:maps", unload = TRUE)
update.packages()
#detach("package:ggplot2", unload = TRUE) # remove the packages
head(diamonds)
#tail(diamonds)
#qplot(diamonds$carat, diamonds$price, diamonds, color=diamonds$clarity)
hist(diamonds$price,col = "green", border = "red")

#Exercise 1: What you can tell about the price distributions (i.e. frequencies) 
#for the Diamond data frame? Use ggplot2 histogram to show your answer.
#From the histogram what you can tell about the price range most people prefer to buy? 
ggplot(diamonds) + geom_histogram(binwidth=500, aes(x=price))+
  xlab("Diamond Price U$") + ylab("Frequency")+  ggtitle("Diamond Price Distribution")

#it is always best to put aes() into the ggplot(), which is the original call
ggplot(diamonds, aes(x=price)) + geom_histogram(binwidth= 500) + 
  xlab("Price") + ylab("Frequncy") + ggtitle("Diamonds Price distribution")                            


#Exercise 2: Answer the following question by adding R 
  #statements that prints the answers for these questions:
  #1.mean of the prices
  price.mean<- mean(diamonds$price,trim = 0 ,na.rm= TRUE)
  print(price.mean)
  #2.how many diamonds with price<= $500
  sum(diamonds$price <= 500)
  #3.price>= $10000
  sum(diamonds$price >= 10000)

#Exercise 3:  Plot a histogram of the prices distribution for 
  #prices up to $2500. Design your histogram to show values for 
  #each $500 increment. Can you tell now which bin has the highest value?  
ggplot(diamonds,aes(x=price)) + geom_histogram(binwidth = 50) + 
ggtitle("Diamond Price Distribution")+ 
xlab("Price") + ylab("Frequency") + xlim(0,2500)


#Exercise 4: Use scatter graph to show the relation between the carat and price. 
qplot(diamonds$carat, diamonds$price, xlab = "Carat", ylab = "Price") + 
  ggtitle("Diamond Price vs Carat")


#Exercise 5: Use Scatter graph to show the relation between the carat 
  #and the volume of the diamond (i.e. multiplications of the three dimensions x*y*z). 
qplot(diamonds$carat, diamonds$x*diamonds$y*diamonds$z, ylab = "Carat", xlab = "volume")


#Exercise 6: Use Scatter graph to show the distribution 
  #of prices vs carat according to the color type of the diamond.
qplot(diamonds$carat, diamonds$price,color = diamonds$color)+ xlab("Carat") + ylab("Price")


#Exercise 7: Use Scatter graph to show the distribution 
  #of prices vs carat according to the cut type of the diamond.
qplot(diamonds$carat, diamonds$price,color = diamonds$cut)
+  xlab("Carat") + ylab("Price")


#Exercise 8: Using the scatter graph of price vs carat, 
  #plot a smooth curve that can fits the trend of the data.
ggplot(diamonds, aes(x= log10(carat),y= log10(price))) +
  geom_point()+ ggtitle("Diamond Price vs Carat")+ 
  xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)

ggplot(diamonds, aes(x=carat,y=price)) + geom_bin2d(aes(color=factor(color))) + stat_smooth(se=FALSE)


#Exercise 9: Using the scatter graph of price vs carat with respect to the diamond color 
  #and find a smooth line that fits such scattered data. 
ggplot(diamonds, aes(x= diamonds$carat,y= diamonds$price))+
geom_point(aes(color=factor(diamonds$color))) + 
ggtitle("Diamond Price vs Carat due to the colors")+ 
xlab("Carat") + ylab("Price") + stat_smooth(se=FALSE)



browseURL("http://cran.r-project.org//web/views/")





