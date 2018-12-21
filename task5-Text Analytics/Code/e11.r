#=========================================

# Task5 Exercise 11: Print the frequent words at training dtm (any word above 5 times)
freq_terms_train <- findFreqTerms(dtm_train, lowfreq = 5)
freq_terms_train
#=========================================