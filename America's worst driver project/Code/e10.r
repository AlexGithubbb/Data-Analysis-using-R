#**************************************nums**************************************
# Exercise 10: Plot the histogram of the number of Drivers Involved In Fatal Collisions Per Billion Miles In Each State with a descending trend and 
# show the mean value line 
mean(nums) # 15.7902
ggplot(bad_drivers2, aes(x=State, y=nums, label = nums)) + 
  geom_bar(stat="identity", fill="#C62D42") + geom_text(color="white" ,position = position_stack(vjust = 0.6))+ 
  ylab("Number of drivers") +
  geom_hline(aes(yintercept = mean(nums)), color= "black")+
  labs(title = "Number of Drivers Involved In Fatal Collisions Per Billion Miles In Each State",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  coord_flip() 