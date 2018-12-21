# **************************************not_distracted_num **************************************
# Exercise 13: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Were Not Distracted In Each State and
# the total collisions and show the mean value line 
mean(not_distracted_num) # 13.57294
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#93CCEA")+ 
  geom_col(aes(x =State, y= not_distracted_num),fill= "navyblue") +
  geom_text(aes(x = State, y= not_distracted_num, label= not_distracted_num), color= "white", position = position_stack(vjust = 0.2))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1.05))+ 
  geom_hline(aes(yintercept = mean(not_distracted_num)), color= "#FF5470")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Not Distracted",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()