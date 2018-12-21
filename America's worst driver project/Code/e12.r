# **************************************alcohol_num **************************************
# Exercise 12: Plot the histogram of the number of  Drivers Involved In Fatal Collisions While Alcohol Impaired In Each State, 
# the total collisions and show the mean value line 
mean(alcohol_num) # 4.887059
ggplot(bad_drivers2) + geom_bar(aes(State,nums),stat = "identity", fill= "#63B76C")+ 
  geom_col(aes(x =State, y= alcohol_num),fill= "darkgreen") +
  geom_text(aes(x = State, y= alcohol_num, label= alcohol_num), color= "white", position = position_stack(vjust = 0.5))+ 
  geom_text(aes(x = State, y= nums, label= nums), color= "black", position = position_stack(vjust = 0.9))+ 
  geom_hline(aes(yintercept = mean(alcohol_num)), color= "#FDFF00")+
  labs(title = "Drivers Involved In Fatal Collisions Who Were Alcohol Impaired",
       subtitle="As a share of fatal collisions per billion miles, 2012") +
  ylab("Number of Drivers")+
  coord_flip()