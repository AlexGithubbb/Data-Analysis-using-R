#=========================================
# Task5 Exercise 1 
Needed <- c("tm","SnowballCC","RColorBrewer","ggplot2","wordcloud","biclust","igraph","fpc")
install.packages(Needed, dependencies = T)
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/",type = "source")
setwd("/Users/Alexpower/Desktop/R/task5")
getwd()
library("tm")
library("NLP")
sms <- read.csv("spam_ham.csv",stringsAsFactors = FALSE)
head(sms)
str(sms)
summary(sms)
sms$text
#=========================================
# Task5 Exercise 2: Change the type of all the attributes into factor:
sms$type <- as.factor(sms$type)

#=========================================

# Task5 Exercise 3: Inspect how many Spam and Pam at the converted corpus:
table(sms$type)
#sms_text <- paste(sms$text)
#sms_source <- VectorSource(sms_text)

#=========================================

# Task5 Exercise 4: Building a corpus by using 'tm' package
#corpus <- Corpus(sms_source)
corpus <- Corpus(VectorSource(sms$text))
print(corpus)

#=========================================
# Task5 Exercise 5: Inspect the first 3 messages at the corpus
inspect(corpus[1:3])
#=========================================

# Task5 Exercise 6: cleaning the text for corpus
getTransformations()
corpus <- tm_map(corpus, content_transformer(tolower)) # covert to lower case
corpus <- tm_map(corpus, removeNumbers) # remove numbers
corpus <- tm_map(corpus, removePunctuation) # remove punctuation
corpus <- tm_map(corpus, stripWhitespace) # Strip whitespace
inspect(corpus[1:3])

#=========================================
# Task5 Exercise 7: create dtm for the cleaned corpus
dtm <- DocumentTermMatrix(corpus)

str(dtm)
print(dtm)

#=========================================

# Task5 Exercise 8: inspect the generated dtm
inspect(dtm)
#=========================================
# Task5 Exercise 9: split the dtm into trainning (80%) and testing (20%)
dim(dtm)
dtm_train <- dtm[1:4459,] # about 80% 
dtm_test <- dtm[4460:5574,] # the rest
sms_train<- sms[1:4459,]
sms_test <- sms[4459:5574,]
corpus_train = corpus[1:4459]
corpus_test  = corpus[4459:5574]

print(dtm)
print(dtm_train)
print(dtm_test)
print(sms_train)
print(sms_test)
print(corpus_train)
print(corpus_test)

#=========================================
# Task5 Exercise 10: wordcloud printing
install.packages("wordcloud")
library("wordcloud")
wordcloud(corpus_train,
          max.words=100,     # look at the 100 most common words
          scale=c(4, 0.5, 7)) 
wordcloud(corpus_test,
          max.words=100,     # look at the 100 most common words
          scale=c(4, 0.5, 7))

#=========================================

# Task5 Exercise 11: Print the frequent words at training dtm
# method1:
freq_terms_train <- findFreqTerms(dtm_train, lowfreq = 5)
freq_terms_train
# method2:
freq_terms = findFreqTerms(dtm_train, 5)
freq_terms
#=========================================
# Task5 Exercise 12: use the library e1071 to train a Naive Bayes(NB) classifier and
# predict the outcome of the spam classifier using the testing dtm

reduced_dtm_train = DocumentTermMatrix(corpus_train, list(dictionary=freq_terms))
reduced_dtm_test =  DocumentTermMatrix(corpus_test, list(dictionary=freq_terms))
ncol(reduced_dtm_train)
# Since that NB works on factors, but this DTM only has numerics. it is necessary to define a function
# which converts counts to yes/no factor, and apply it to our reduced matrices.
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


