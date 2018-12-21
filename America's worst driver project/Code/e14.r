# **************************************first_collision_num ************************************** 
# Exercise 14: Plot the histogram of the number of  Drivers Involved In Fatal Collisions Who Had Not Been Involed In Any Previous Collision In 
# Each State and the total collisions, show the mean value line too
mean(first_collision_num) # 14.00549
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#CC99BA")+ 
  geom_col(aes(x =State, y= first_collision_num),fill= "#6A2963") +
  # label of first_collision_num
  geom_text(aes(x = State, y= first_collision_num, label= first_collision_num), color= "white", position = position_stack(vjust = 0.5))+ 
  # label of total number of drivers
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 1.05))+ 
  geom_hline(aes(yintercept = mean(not_distracted_num)), color= "#FDFF00")+
  labs(title = "Drivers Involved In Fatal Collisions Who Had Not Been Involed In Any Previous Collision",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()
