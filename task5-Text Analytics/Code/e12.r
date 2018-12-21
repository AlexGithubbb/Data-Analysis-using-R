#=========================================
# Task5 Exercise 12: use the library e1071 to train a Naive Bayes(NB) classifier and predict the outcome of the spam classifier using the testing dtm
freq_terms = findFreqTerms(dtm_train, 5)
reduced_dtm_train = DocumentTermMatrix(corpus_train, list(dictionary=freq_terms))
reduced_dtm_test =  DocumentTermMatrix(corpus_test, list(dictionary=freq_terms))
ncol(reduced_dtm_train) # 1386, means that we have reduced the number of features

# Since that NB works on factors, but this DTM only has numerics. it is necessary to define a function which converts counts to yes/no factor, and apply it to our reduced matrices.
convert_counts = function(x) {
  x = ifelse(x > 0, 1, 0)
  x = factor(x, levels = c(0, 1), labels=c("No", "Yes"))
  return (x)
}

# apply() allows us to work either with rows or columns of a matrix.
# MARGIN = 1 is for rows, and 2 for columns
reduced_dtm_train = apply(reduced_dtm_train, MARGIN=2, convert_counts)
reduced_dtm_test  = apply(reduced_dtm_test, MARGIN=2, convert_counts)

#install.packages("e1071")
install.packages("e1071", dep = TRUE) 
# start up the package
library("e1071")
# store the model in sms_classifier by using Naive Bayes method
sms_classifier = naiveBayes(reduced_dtm_train, sms_train$type)
# Build sms_test_predicted to predict the outcome of the spam classifier
sms_test_predicted = predict(sms_classifier,reduced_dtm_test)

# we'll use CrossTable() from gmodels
install.packages("gmodels")
library(gmodels)
CrossTable(sms_test_predicted,
           sms_test$type,
           prop.chisq = FALSE, # as before
           prop.t     = FALSE, # eliminate cell proprtions
           dnn        = c("predicted", "actual")) # relabels rows+cols


