# **************************************** insur_comp_loses ***********************************
# Exercise 16: Plot the histogram of the Loses Incurred By Insurance Companies($) In Each State with a descending trend and show the mean value line
mean(insur_comp_loses) # $134.4931
ggplot(bad_drivers2, aes(State, insur_comp_loses, label= insur_comp_loses))+ 
  geom_bar(stat = "identity", fill= "#6B3FA0") + 
  labs(title = "Loses Incurred By Insurance Companies($)",
       subtitle="Collosions per insured drivers, 2010") +
  geom_hline(aes(yintercept = mean(insur_comp_loses)), color = "#87FF2A")+
  ylab("Company Companies Loses($)")+
  geom_text(color="white", position = position_stack(vjust = 0.63))+
  coord_flip() + theme_dark()
