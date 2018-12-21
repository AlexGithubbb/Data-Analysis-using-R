#Exercise 4:
#Use scatter graph to show the relation between the carat and price. 
qplot(diamonds$carat, diamonds$price, xlab = "Carat", ylab = "Price") + 
ggtitle("Diamond Price vs Carat")
# With log one:
ggplot(diamonds,aes(x=log10(carat), y=log10(price)))+ geom_point()+ggtitle("Diamond Price vs Carat")
