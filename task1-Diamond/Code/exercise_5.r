#Exercise 5: Use Scatter graph to show the relation between the carat 
#and the volume of the diamond (i.e. multiplications of the three dimensions x*y*z). 
ggplot(diamonds,aes(x=carat, y= x*y*z))+geom_point()+xlab("Carat") + 
  ylab("Volume/mm^3") + ggtitle("Relation between the Carat and the Volume of the diamonds")

#shrink the range of y axis for a better visualisation
ggplot(diamonds,aes(x=carat, y= x*y*z))+geom_point()+xlab("Carat") + 
  ylab("Volume/mm^3") + ylim(0,1000)
  ggtitle("Relation between the Carat and the Volume of the diamonds")




      