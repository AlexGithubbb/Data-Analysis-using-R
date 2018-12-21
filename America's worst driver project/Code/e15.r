# **************************************** car_insurance *********************************** 
# Exercise 15: Plot the histogram of the number of Car Insurance Premiums($) In Each State with a descending trend and show the mean value line
mean(car_insurance) # $886.9576
ggplot(bad_drivers2, aes(State, car_insurance, label= car_insurance))+ 
  geom_bar(stat = "identity", fill= "#C88A65") + 
  labs(title = "Average Combined Insurance Premium",
       subtitle="2011") +
  ylab("Car Insurance Premiums($)")+
  geom_hline(aes(yintercept = mean(car_insurance)), color= "#87FF2A")+
  geom_text(color="white", position = position_stack(vjust = 0.57))+
  coord_flip() + theme_dark()