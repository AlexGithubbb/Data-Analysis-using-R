# **************************************speeding_num **************************************
# Exercise 11: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Were Speeding In Each State, 
# the total collisions and show the mean value line 
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#FFC800")+ 
  geom_col(aes(x =State, y= speeding_num),fill= "#FA9C44") +
  geom_text(aes(x = State, y= speeding_num, label= speeding_num), color= "black", position = position_stack(vjust = 0.5))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1))+
  geom_hline(aes(yintercept = mean(speeding_num)), color= "black")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Speeding",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()