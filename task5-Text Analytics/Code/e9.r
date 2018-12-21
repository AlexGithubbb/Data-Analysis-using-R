#=========================================
# Task5 Exercise 9: split the dtm into trainning (80%) and testing (20%)
dtm_train <- dtm[1:4459,] # about 80% 
dtm_test <- dtm[4460:5574,] # the rest
sms_train<- sms[1:4459,]
sms_test <- sms[4460:5574,]
corpus_train = corpus[1:4459]
corpus_test  = corpus[4460:5574]

print(dtm)
print(dtm_train)
print(dtm_test)
print(sms_train)
print(sms_test)
print(corpus_train)
print(corpus_test)

#=========================================