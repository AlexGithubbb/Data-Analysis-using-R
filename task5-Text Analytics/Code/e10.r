#=========================================
# Task5 Exercise 10: use wordcloud library to visualize both training dtm and testing dtm
install.packages("wordcloud")
library("wordcloud")
#the training dtm visualization
wordcloud(corpus_train,
          max.words=100,     # look at the 100 most common words
          scale=c(4, 0.5, 7)) 
# the testing dtm visualization
wordcloud(corpus_test,
          max.words=100,     # look at the 100 most common words
          scale=c(4, 0.5, 7))

#=========================================