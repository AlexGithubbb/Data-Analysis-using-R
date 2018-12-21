#Task2 Exercise 9 ggplot2 (revenue vs profit according to companiy types)
ggplot(companiesData,aes(x=profit,y=revenue,color=factor(company))) + geom_point() + 
  xlab("Profit") + ylab("Revenue")+ stat_smooth(se = FALSE)
