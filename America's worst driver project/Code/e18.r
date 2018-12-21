# Exercise 18: Plot the histogram based on the variables
ggplot(long_reshape, aes(State, value, fill=variable, label = value)) + 
  geom_bar(stat = "identity") + xlab("US States") + ylab("The number of Drivers")+
  labs(title = "The number of drivers under different condition in each State",
       subtitle="As a share of fatal collisions per billion miles, 2012")+
  coord_flip() + geom_text(aes(label = value), position = position_stack(vjust = 0.5))