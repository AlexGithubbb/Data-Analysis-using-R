#=========================================

# Task5 Exercise 4: Building a corpus by using 'tm' package
#corpus <- Corpus(sms_source)
corpus <- Corpus(VectorSource(sms$text))
print(corpus)

#=========================================